CREATE TABLE [dbo].[ScheduleItems] (
    [ID]              INT      IDENTITY (1, 1) NOT NULL,
    [EmployeeID]      INT      NOT NULL,
    [ServiceTicketID] INT      NOT NULL,
    [Start]           DATETIME NOT NULL,
    [WorkHours]       INT      NOT NULL,
    [AssignedOn]      DATETIME NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ScheduleItem_Employee] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([ID]) ON DELETE CASCADE,
    CONSTRAINT [ScheduleItem_ServiceTicket] FOREIGN KEY ([ServiceTicketID]) REFERENCES [dbo].[ServiceTickets] ([ID]) ON DELETE CASCADE
);

