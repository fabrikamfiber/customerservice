CREATE TABLE [dbo].[Escalations] (
    [Id]         INT        NOT NULL,
    [Escalation] NCHAR (10) NULL,
    [Levels]     NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

