CREATE TABLE [dbo].[EdmMetadata] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [ModelHash] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

