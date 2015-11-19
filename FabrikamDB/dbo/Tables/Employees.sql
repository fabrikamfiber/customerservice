CREATE TABLE [dbo].[Employees] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]      NVARCHAR (MAX) NULL,
    [LastName]       NVARCHAR (MAX) NULL,
    [Address_Street] NVARCHAR (MAX) NULL,
    [Address_City]   NVARCHAR (MAX) NULL,
    [Address_State]  NVARCHAR (MAX) NULL,
    [Address_Zip]    NVARCHAR (MAX) NULL,
    [Identity]       NVARCHAR (MAX) NULL,
    [ServiceAreas]   NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

