CREATE TABLE [dbo].[Customer] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (100) NOT NULL,
    [Address]    NVARCHAR (200) NULL,
    [phone]      INT            NOT NULL,
    [TestColumn] NCHAR (10)     NULL
);





