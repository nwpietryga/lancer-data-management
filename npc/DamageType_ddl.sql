USE LANCER;
GO

CREATE TABLE dbo.DamageType (
	DamageTypeID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DamageType_DamageTypeID PRIMARY KEY,
	Name VARCHAR(15) NOT NULL --kinetic, energy, explosive, burn, heat, memetic
);
GO

/*
INSERT INTO dbo.DamageType (
	Name
)
VALUES
('Kinetic'),
('Energy'),
('Explosive'),
('Burn'),
('Heat'),
('Memetic');
GO
*/