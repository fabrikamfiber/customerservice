CREATE TABLE [dbo].[Messages] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Sent]        DATETIME       NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

