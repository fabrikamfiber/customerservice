namespace FabrikamFiber.Web.Tests
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Web.Mvc;
    using FabrikamFiber.DAL.Data;
    using FabrikamFiber.DAL.Models;
    using FabrikamFiber.Web.Controllers;
    using Microsoft.VisualStudio.TestTools.UnitTesting;

    [TestClass()]
    public class CustomersControllerTest
    {
        MockCustomerRepository mockCustomerRepo;
        CustomersController controller;

        [TestInitialize()]
        public void SetupController()
        {
            mockCustomerRepo = new MockCustomerRepository();
            controller = new CustomersController(mockCustomerRepo);
        }
        
        [TestMethod()]
        public void CreateInsertsCustomerAndSaves()
        {
            controller.Create(new Customer());

            Assert.IsTrue(mockCustomerRepo.IsInsertOrUpdateCalled);
            Assert.IsTrue(mockCustomerRepo.IsSaveCalled);
        }

        [TestMethod()]
        //[ExpectedException(typeof(ArgumentNullException))]
        public void CreateNullCustomer()
        {
            controller.Create(null);
            Assert.IsTrue(mockCustomerRepo.IsSaveCalled);

        }

        [TestMethod()]
        public void EditUpdatesCustomerAndSaves()
        {
            controller.Edit(new Customer());

            Assert.IsTrue(mockCustomerRepo.IsInsertOrUpdateCalled);
            Assert.IsTrue(mockCustomerRepo.IsSaveCalled);
        }

        [TestMethod()]
        public void DeleteConfirmedDeletesCustomerAndSaves()
        {
            controller.DeleteConfirmed(1);

            Assert.IsTrue(mockCustomerRepo.IsDeleteCalled);
            Assert.IsTrue(mockCustomerRepo.IsSaveCalled);
        }

        [TestMethod()]
        public void DeleteFindAndReturnsCustomer()
        {
            var result = controller.Delete(1);

            Assert.IsTrue(mockCustomerRepo.IsFindCalled);
            Assert.IsInstanceOfType(((ViewResult)result).Model, typeof(Customer));
        }

        #region Mocks
        class MockCustomerRepository : ICustomerRepository
        {
            public bool IsInsertOrUpdateCalled { get; set; }

            public bool IsSaveCalled { get; set; }

            public bool IsDeleteCalled { get; set; }

            public bool IsFindCalled { get; set; }

            public IQueryable<Customer> All
            {
                get { throw new NotImplementedException(); }
            }

            public IQueryable<Customer> AllIncluding(params Expression<Func<Customer, object>>[] includeProperties)
            {
                throw new NotImplementedException();
            }

            public Customer Find(int id)
            {
                this.IsFindCalled = true;
                return new Customer();
            }

            public void InsertOrUpdate(Customer customer)
            {
                this.IsInsertOrUpdateCalled = true;
            }

            public void Delete(int id)
            {
                this.IsDeleteCalled = true;
            }

            public void Save()
            {
                this.IsSaveCalled = true;
            }
        }
        #endregion
    }
}
