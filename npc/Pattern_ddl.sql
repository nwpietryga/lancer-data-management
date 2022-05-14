USE LANCER;
GO

CREATE TABLE dbo.Pattern (
	PatternID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Pattern_PatternID PRIMARY KEY,
	Name VARCHAR(10) NOT NULL
);
GO


/*
INSERT INTO dbo.Pattern (
	Name
)
VALUES
('None'), --Here for multi-profile weapons that use normal Range as well as a special pattern
('Line'),
('Cone'),
('Blast'),
('Burst');
*/