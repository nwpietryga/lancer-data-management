USE LANCER;
GO

CREATE TABLE dbo.NpcGroup (
	NpcGroupID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_NpcGroup_NpcGroup_ID PRIMARY KEY,
	Name VARCHAR(15) NOT NULL
);
GO

/*
IF NOT EXISTS (
	SELECT TOP 1 1
	FROM dbo.NpcGroup
)
INSERT INTO dbo.NpcGroup (
	Name
)
VALUES 
('Striker'),
('Controller'),
('Defender'),
('Artillery'),
('Support');
*/