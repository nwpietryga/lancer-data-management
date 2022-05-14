USE LANCER;
GO

CREATE TABLE dbo.SaveCheckTarget (
	SaveCheckTargetID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_SaveCheckTarget_SaveCheckTargetID PRIMARY KEY,
	Name VARCHAR(15) NOT NULL --hull, agility, systems, engineering, grit
);
GO

/*
INSERT INTO dbo.SaveCheckTarget (
	Name
)
VALUES
('Hull'),
('Agility'),
('Systems'),
('Engineering'),
('Grit')
*/