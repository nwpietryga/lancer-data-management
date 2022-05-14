USE LANCER;
GO

CREATE TABLE dbo.SaveCheckType (
	SaveCheckTypeID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_SaveCheckType_SaveCheckTypeID PRIMARY KEY,
	Name VARCHAR(15) NOT NULL --save, check, contested
);

/*
INSERT INTO SaveCheckType (
	Name
)
VALUES
('Save'),
('Check'),
('Contested')
*/