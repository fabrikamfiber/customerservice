namespace FabrikamFiber.Web.Tests.Controllers
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Mvc;
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.DAL.Models;
    using FabrikamFiber.Web.Controllers;
    using FabrikamFiber.Web.ViewModels;
    using NUnit.Framework;
    using NUnit.Mocks;

    [TestFixture]
    public class ServiceTicketsControllerTest
    {
        DynamicMock mockCustomerRepo;
        DynamicMock mockEmployeeRepo;
        DynamicMock mockServiceTicketRepo;
        DynamicMock mockLogEntryRepo;
        DynamicMock mockScheduleItemRepo;
        ServiceTicketsController controller;

        [SetUp]
        public void SetupController()
        {
            mockCustomerRepo = new DynamicMock(typeof(ICustomerRepository));
            mockEmployeeRepo = new DynamicMock(typeof(IEmployeeRepository));
            mockServiceTicketRepo = new DynamicMock(typeof(IServiceTicketRepository));
            mockLogEntryRepo = new DynamicMock(typeof(IServiceLogEntryRepository));
            mockScheduleItemRepo = new DynamicMock(typeof(IScheduleItemRepository));

            controller = new ServiceTicketsController(
                mockCustomerRepo.MockInstance as ICustomerRepository,
                mockEmployeeRepo.MockInstance as IEmployeeRepository,
                mockServiceTicketRepo.MockInstance as IServiceTicketRepository,
                mockLogEntryRepo.MockInstance as IServiceLogEntryRepository,
                mockScheduleItemRepo.MockInstance as IScheduleItemRepository
            );
        }

        [Xunit.Fact]
        public void ScheduleActionReturnsValidViewModel()
        {
            this.SetupController();

            // Arrange
            mockServiceTicketRepo.SetReturnValue("FindIncluding", new ServiceTicket { ID = 1 });
            mockEmployeeRepo.SetReturnValue("Find", new Employee { ID = 1 });
            var scheduleItems = new List<ScheduleItem>();
            scheduleItems.Add(new ScheduleItem { ID = 1, });
            mockScheduleItemRepo.SetReturnValue("AllIncluding", scheduleItems.AsQueryable<ScheduleItem>());

            // Act
            var result = (ViewResult)controller.Schedule(1, 1, 0);

            // Assert
            var model = result.ViewData.Model as ScheduleViewModel;
            Assert.NotNull(model.Employee);
            Assert.NotNull(model.ScheduleItems);
            Assert.NotNull(model.ServiceTicket);
            controller.ViewBag.StartTime = 0;
        }

        [Xunit.Fact]
        public void ScheduleActionCorrectlyUpdatesRepositories()
        {
            this.SetupController();

            // Arrange
            var scheduleItems = new List<ScheduleItem>();
            scheduleItems.Add(new ScheduleItem { ServiceTicketID = 1 });
            //mockScheduleItemRepo.SetReturnValue("get_All", scheduleItems.AsQueryable<ScheduleItem>());
            mockScheduleItemRepo.SetReturnValue("InsertOrUpdate", null);
            mockScheduleItemRepo.SetReturnValue("Delete", null);
            mockScheduleItemRepo.ExpectAndReturn("Save", null);

            ServiceTicket ticket = new ServiceTicket { ID = 0 };
            mockServiceTicketRepo.SetReturnValue("Find", ticket);
            mockServiceTicketRepo.ExpectAndReturn("Save", null);

            // Act
            controller.AssignSchedule(1, 101, 0);

            // Assert
            Assert.AreEqual(101, ticket.AssignedToID);
            mockScheduleItemRepo.Verify();
            mockServiceTicketRepo.Verify();
        }
    }
}
