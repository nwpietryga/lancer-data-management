USE LANCER;
GO

CREATE TABLE dbo.NpcTemplate (
	NpcTemplateID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_NpcTemplate_NpcTemplateID PRIMARY KEY,
	Name VARCHAR(15) NOT NULL
);
GO