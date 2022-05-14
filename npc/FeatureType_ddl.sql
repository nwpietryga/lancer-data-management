USE LANCER;
GO

CREATE TABLE dbo.FeatureType (
	FeatureTypeID INT IDENTITY(1,1) CONSTRAINT PK_FeatureType_FeatureTypeID PRIMARY KEY,
	Name VARCHAR(25) NOT NULL --trait, reaction, system, weapon, etc.
);
GO

/*
INSERT INTO dbo.FeatureType (
	Name
)
VALUES
('Trait'),
('System'),
('Weapon')
*/