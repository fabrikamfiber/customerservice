CREATE TABLE [dbo].[ServiceLogEntries] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [CreatedAt]       DATETIME       NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [CreatedByID]     INT            NULL,
    [ServiceTicketID] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ServiceLogEntry_CreatedBy] FOREIGN KEY ([CreatedByID]) REFERENCES [dbo].[Employees] ([ID]),
    CONSTRAINT [ServiceLogEntry_ServiceTicket] FOREIGN KEY ([ServiceTicketID]) REFERENCES [dbo].[ServiceTickets] ([ID]) ON DELETE CASCADE
);

