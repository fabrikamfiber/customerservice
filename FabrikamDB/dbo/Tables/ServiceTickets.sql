CREATE TABLE [dbo].[ServiceTickets] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [Title]           NVARCHAR (MAX) NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [StatusValue]     INT            NOT NULL,
    [EscalationLevel] INT            NOT NULL,
    [Opened]          DATETIME       NULL,
    [Closed]          DATETIME       NULL,
    [CustomerID]      INT            NULL,
    [CreatedByID]     INT            NULL,
    [AssignedToID]    INT            NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ServiceTicket_AssignedTo] FOREIGN KEY ([AssignedToID]) REFERENCES [dbo].[Employees] ([ID]),
    CONSTRAINT [ServiceTicket_CreatedBy] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Employees] ([ID]),
    CONSTRAINT [ServiceTicket_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([ID])
);

