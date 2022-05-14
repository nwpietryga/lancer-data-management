USE LANCER;
GO

CREATE TABLE dbo.NpcClass (
	NpcClassID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_NpcClass_NpcClassID PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Size TINYINT NOT NULL
);
GO

/*
IF NOT EXISTS (
	SELECT TOP 1 1
	FROM dbo.NpcClass
)
INSERT INTO dbo.NpcClass (
	Name,
	Size
)
VALUES
('Ace', 1),
('Aegis', 1),
('Archer', 1),
('Assassin', 1),
('Assault', 1),
('Barricade', 2),
('Bastion', 2),
('Berserker', 1),
('Bombard', 1),
('Breacher', 1),
('Cataphract', 1),
('Demolisher', 2),
('Engineer', 1),
('Goliath', 3),
('Hive', 1),
('Hornet', 1),
('Mirage', 1),
('Operator', 1),
('Priest', 1),
('Pyro', 1),
('Rainmaker', 1),
('Ronin', 1),
('Scourer', 1),
('Scout', 1),
('Seeder', 1),
('Sentinel', 1),
('Sniper', 1),
('Specter', 1),
('Support', 2),
('Witch', 1);
*/