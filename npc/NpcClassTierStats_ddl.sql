USE LANCER;
GO

CREATE TABLE dbo.NpcClassTierStats (
	NpcClassID INT NOT NULL CONSTRAINT FK_NpcClassTierStats_NpcClassID_NpcClass_NpcClassID FOREIGN KEY REFERENCES NpcClass(NpcClassID),
	NpcTierID INT NOT NULL CONSTRAINT FK_NpcClassTierStats_NpcTierID_NpcTier_NpcTierID FOREIGN KEY REFERENCES NpcTier(NpcTierID),
	Hull SMALLINT NOT NULL,
	Agility SMALLINT NOT NULL,
	Systems SMALLINT NOT NULL,
	Engineering SMALLINT NOT NULL,
	HP SMALLINT NOT NULL,
	Armor TINYINT NOT NULL CONSTRAINT DF_NpcClassTierStats_Armor_0 DEFAULT(0),
	Evasion TINYINT NOT NULL,
	EDefense TINYINT NOT NULL,
	HeatCap TINYINT NOT NULL,
	Sensors TINYINT NOT NULL,
	SaveTarget TINYINT NOT NULL,
	Speed TINYINT NOT NULL
);
GO

/*
IF NOT EXISTS (
	SELECT TOP 1 1
	FROM dbo.NpcClassTierStats
)
BEGIN
	
	INSERT INTO dbo.NpcClassTierStats (
		NpcClassID,
		NpcTierID,
		Hull,
		Agility,
		Systems,
		Engineering,
		HP,
		Armor,
		Evasion,
		EDefense,
		HeatCap,
		Sensors,
		SaveTarget,
		Speed
	)
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2 AS Hull,
		3 AS Agility,
		1 AS Systems,
		0 AS Engineering,
		10 AS HP,
		0 AS Armor,
		12 AS Evasion,
		8 AS EDefense,
		8 AS HeatCap,
		10 Sensors,
		10 AS SaveTarget,
		5 AS Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Ace'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2,
		4,
		2,
		1,
		12,
		0,
		15,
		8,
		8,
		10,
		12,
		6
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Ace'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2,
		6,
		3,
		1,
		14,
		0,
		18,
		10,
		8,
		10,
		14,
		7
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Ace'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0,
		-2,
		2,
		2,
		14,
		2,
		7,
		10,
		10,
		8,
		10,
		3
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Aegis'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		-1, --A
		3, --S
		3, --E
		18, --HP
		2, --Armor
		8, --Evasion
		12, --EDef
		10, --HeatCap
		10, --Sensors
		11, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Aegis'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		-1, --A
		4, --S
		5, --E
		18, --HP
		3, --Armor
		8, --Evasion
		14, --EDef
		10, --HeatCap
		10, --Sensors
		12, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Aegis'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		2, --A
		2, --S
		-1, --E
		16, --HP
		0, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		15, --Sensors
		11, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Archer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		3, --A
		3, --S
		-1, --E
		20, --HP
		0, --Armor
		10, --Evasion
		10, --EDef
		8, --HeatCap
		15, --Sensors
		13, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Archer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		4, --A
		4, --S
		-1, --E
		20, --HP
		1, --Armor
		12, --Evasion
		12, --EDef
		8, --HeatCap
		15, --Sensors
		16, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Archer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		2, --A
		1, --S
		-1, --E
		15, --HP
		0, --Armor
		12, --Evasion
		8, --EDef
		7, --HeatCap
		10, --Sensors
		10, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Assassin'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		3, --A
		1, --S
		0, --E
		15, --HP
		1, --Armor
		15, --Evasion
		8, --EDef
		8, --HeatCap
		10, --Sensors
		12, --Save
		7 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Assassin'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		4, --A
		2, --S
		0, --E
		15, --HP
		1, --Armor
		17, --Evasion
		8, --EDef
		9, --HeatCap
		10, --Sensors
		14, --Save
		8 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Assassin'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		1, --A
		1, --S
		1, --E
		15, --HP
		1, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		8, --Sensors
		10, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Assault'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		2, --A
		2, --S
		2, --E
		18, --HP
		1, --Armor
		10, --Evasion
		9, --EDef
		8, --HeatCap
		8, --Sensors
		12, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Assault'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		3, --A
		3, --S
		3, --E
		21, --HP
		1, --Armor
		12, --Evasion
		10, --EDef
		8, --HeatCap
		8, --Sensors
		14, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Assault'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		-2, --A
		1, --S
		3, --E
		12, --HP
		1, --Armor
		6, --Evasion
		9, --EDef
		10, --HeatCap
		15, --Sensors
		12, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Barricade'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-2, --A
		1, --S
		5, --E
		16, --HP
		1, --Armor
		7, --Evasion
		11, --EDef
		11, --HeatCap
		15, --Sensors
		15, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Barricade'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		-2, --A
		2, --S
		6, --E
		20, --HP
		1, --Armor
		8, --Evasion
		13, --EDef
		12, --HeatCap
		15, --Sensors
		18, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Barricade'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		-3, --A
		0, --S
		2, --E
		10, --HP
		3, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		5, --Sensors
		8, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Bastion'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		-3, --A
		0, --S
		4, --E
		10, --HP
		3, --Armor
		10, --Evasion
		8, --EDef
		10, --HeatCap
		5, --Sensors
		10, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Bastion'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		6, --H
		-2, --A
		0, --S
		4, --E
		10, --HP
		4, --Armor
		10, --Evasion
		8, --EDef
		12, --HeatCap
		5, --Sensors
		12, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Bastion'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		2, --A
		-2, --S
		-1, --E
		12, --HP
		1, --Armor
		8, --Evasion
		6, --EDef
		6, --HeatCap
		5, --Sensors
		10, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Berserker'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		3, --A
		-2, --S
		-1, --E
		16, --HP
		1, --Armor
		9, --Evasion
		6, --EDef
		6, --HeatCap
		5, --Sensors
		12, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Berserker'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		6, --H
		4, --A
		-2, --S
		0, --E
		20, --HP
		1, --Armor
		10, --Evasion
		6, --EDef
		6, --HeatCap
		5, --Sensors
		14, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Berserker'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		-1, --A
		1, --S
		2, --E
		10, --HP
		0, --Armor
		7, --Evasion
		12, --EDef
		8, --HeatCap
		15, --Sensors
		11, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Bombard'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-1, --A
		2, --S
		3, --E
		13, --HP
		0, --Armor
		8, --Evasion
		14, --EDef
		8, --HeatCap
		15, --Sensors
		13, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Bombard'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-1, --A
		3, --S
		5, --E
		16, --HP
		0, --Armor
		8, --Evasion
		16, --EDef
		8, --HeatCap
		15, --Sensors
		16, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Bombard'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		0, --A
		-1, --S
		1, --E
		18, --HP
		1, --Armor
		9, --Evasion
		7, --EDef
		7, --HeatCap
		5, --Sensors
		10, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Breacher'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		1, --A
		-1, --S
		2, --E
		20, --HP
		1, --Armor
		11, --Evasion
		7, --EDef
		7, --HeatCap
		5, --Sensors
		12, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Breacher'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		2, --A
		-1, --S
		3, --E
		22, --HP
		1, --Armor
		13, --Evasion
		7, --EDef
		8, --HeatCap
		5, --Sensors
		14, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Breacher'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		1, --A
		0, --S
		0, --E
		15, --HP
		0, --Armor
		10, --Evasion
		8, --EDef
		6, --HeatCap
		5, --Sensors
		12, --Save
		8 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Cataphract'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		3, --A
		0, --S
		0, --E
		17, --HP
		0, --Armor
		11, --Evasion
		8, --EDef
		7, --HeatCap
		5, --Sensors
		14, --Save
		8 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Cataphract'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		4, --A
		0, --S
		0, --E
		20, --HP
		0, --Armor
		12, --Evasion
		8, --EDef
		8, --HeatCap
		5, --Sensors
		16, --Save
		8 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Cataphract'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		-2, --A
		-1, --S
		2, --E
		15, --HP
		2, --Armor
		6, --Evasion
		7, --EDef
		8, --HeatCap
		10, --Sensors
		10, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Demolisher'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		-2, --A
		-1, --S
		3, --E
		20, --HP
		2, --Armor
		6, --Evasion
		7, --EDef
		8, --HeatCap
		10, --Sensors
		13, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Demolisher'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		6, --H
		-2, --A
		-1, --S
		4, --E
		25, --HP
		2, --Armor
		6, --Evasion
		7, --EDef
		8, --HeatCap
		10, --Sensors
		15, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Demolisher'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		-1, --A
		1, --S
		3, --E
		20, --HP
		0, --Armor
		7, --Evasion
		10, --EDef
		10, --HeatCap
		15, --Sensors
		10, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Engineer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		-1, --A
		2, --S
		4, --E
		20, --HP
		0, --Armor
		9, --Evasion
		10, --EDef
		12, --HeatCap
		15, --Sensors
		12, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Engineer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		-1, --A
		3, --S
		6, --E
		20, --HP
		0, --Armor
		11, --Evasion
		12, --EDef
		14, --HeatCap
		15, --Sensors
		14, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Engineer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		-2, --A
		1, --S
		0, --E
		25, --HP
		0, --Armor
		6, --Evasion
		6, --EDef
		8, --HeatCap
		10, --Sensors
		11, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Goliath'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		6, --H
		-2, --A
		1, --S
		0, --E
		30, --HP
		0, --Armor
		6, --Evasion
		6, --EDef
		10, --HeatCap
		10, --Sensors
		13, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Goliath'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		6, --H
		-2, --A
		1, --S
		2, --E
		35, --HP
		0, --Armor
		6, --Evasion
		6, --EDef
		12, --HeatCap
		15, --Sensors
		15, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Goliath'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		0, --A
		2, --S
		1, --E
		14, --HP
		0, --Armor
		8, --Evasion
		10, --EDef
		8, --HeatCap
		10, --Sensors
		12, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Hive'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		0, --A
		4, --S
		1, --E
		20, --HP
		0, --Armor
		15, --Evasion
		8, --EDef
		8, --HeatCap
		10, --Sensors
		12, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Hive'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		6, --A
		3, --S
		1, --E
		20, --HP
		0, --Armor
		18, --Evasion
		10, --EDef
		8, --HeatCap
		10, --Sensors
		14, --Save
		7 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Hive'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		2, --A
		2, --S
		0, --E
		8, --HP
		0, --Armor
		16, --Evasion
		6, --EDef
		5, --HeatCap
		5, --Sensors
		12, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Hornet'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		4, --A
		3, --S
		0, --E
		8, --HP
		0, --Armor
		18, --Evasion
		7, --EDef
		6, --HeatCap
		5, --Sensors
		14, --Save
		8 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Hornet'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		6, --A
		4, --S
		0, --E
		8, --HP
		0, --Armor
		20, --Evasion
		8, --EDef
		7, --HeatCap
		10, --Sensors
		16, --Save
		10 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Hornet'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		1, --A
		2, --S
		1, --E
		10, --HP
		0, --Armor
		10, --Evasion
		12, --EDef
		6, --HeatCap
		15, --Sensors
		11, --Save
		5 --Speed

	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Mirage'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		2, --A
		3, --S
		2, --E
		12, --HP
		0, --Armor
		12, --Evasion
		8, --EDef
		6, --HeatCap
		15, --Sensors
		14, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Mirage'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		3, --A
		4, --S
		3, --E
		14, --HP
		0, --Armor
		14, --Evasion
		18, --EDef
		6, --HeatCap
		20, --Sensors
		17, --Save
		7 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Mirage'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		2, --A
		2, --S
		2, --E
		10, --HP
		0, --Armor
		12, --Evasion
		8, --EDef
		8, --HeatCap
		10, --Sensors
		10, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Operator'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		3, --A
		3, --S
		3, --E
		12, --HP
		0, --Armor
		12, --Evasion
		12, --EDef
		8, --HeatCap
		10, --Sensors
		12, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Operator'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		4, --A
		4, --S
		4, --E
		15, --HP
		0, --Armor
		14, --Evasion
		14, --EDef
		8, --HeatCap
		10, --Sensors
		14, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Operator'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		-1, --A
		2, --S
		2, --E
		10, --HP
		0, --Armor
		10, --Evasion
		12, --EDef
		10, --HeatCap
		10, --Sensors
		11, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Priest'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		-1, --A
		4, --S
		3, --E
		13, --HP
		0, --Armor
		10, --Evasion
		15, --EDef
		10, --HeatCap
		10, --Sensors
		13, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Priest'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		-1, --A
		6, --S
		4, --E
		16, --HP
		0, --Armor
		10, --Evasion
		18, --EDef
		10, --HeatCap
		10, --Sensors
		15, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Priest'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-1, --A
		-1, --S
		3, --E
		10, --HP
		3, --Armor
		8, --Evasion
		8, --EDef
		12, --HeatCap
		8, --Sensors
		10, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Pyro'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		0, --A
		-1, --S
		4, --E
		13, --HP
		3, --Armor
		8, --Evasion
		8, --EDef
		14, --HeatCap
		8, --Sensors
		12, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Pyro'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		0, --A
		0, --S
		5, --E
		15, --HP
		4, --Armor
		8, --Evasion
		8, --EDef
		16, --HeatCap
		8, --Sensors
		14, --Save
		2 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Pyro'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		0, --A
		2, --S
		0, --E
		10, --HP
		1, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		15, --Sensors
		10, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Rainmaker'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		1, --A
		3, --S
		0, --E
		12, --HP
		1, --Armor
		10, --Evasion
		8, --EDef
		8, --HeatCap
		15, --Sensors
		12, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Rainmaker'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		1, --A
		3, --S
		1, --E
		14, --HP
		1, --Armor
		12, --Evasion
		12, --EDef
		8, --HeatCap
		15, --Sensors
		14, --Save
		3 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Rainmaker'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		2, --A
		-1, --S
		-1, --E
		18, --HP
		0, --Armor
		10, --Evasion
		7, --EDef
		7, --HeatCap
		10, --Sensors
		10, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Ronin'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		4, --A
		-1, --S
		-1, --E
		20, --HP
		0, --Armor
		13, --Evasion
		7, --EDef
		7, --HeatCap
		10, --Sensors
		13, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Ronin'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		5, --A
		-1, --S
		-1, --E
		22, --HP
		0, --Armor
		16, --Evasion
		7, --EDef
		7, --HeatCap
		10, --Sensors
		15, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Ronin'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		0, --A
		0, --S
		1, --E
		10, --HP
		2, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		10, --Sensors
		10, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Scourer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		1, --A
		0, --S
		2, --E
		13, --HP
		2, --Armor
		9, --Evasion
		8, --EDef
		10, --HeatCap
		10, --Sensors
		12, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Scourer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		1, --A
		1, --S
		4, --E
		15, --HP
		2, --Armor
		10, --Evasion
		8, --EDef
		12, --HeatCap
		10, --Sensors
		14, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Scourer'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		2, --A
		3, --S
		-1, --E
		8, --HP
		0, --Armor
		12, --Evasion
		10, --EDef
		6, --HeatCap
		20, --Sensors
		11, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Scout'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		4, --A
		4, --S
		-1, --E
		8, --HP
		0, --Armor
		15, --Evasion
		13, --EDef
		6, --HeatCap
		20, --Sensors
		13, --Save
		7 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Scout'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		5, --A
		5, --S
		0, --E
		8, --HP
		0, --Armor
		18, --Evasion
		16, --EDef
		6, --HeatCap
		20, --Sensors
		15, --Save
		8 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Scout'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		0, --H
		0, --A
		2, --S
		0, --E
		12, --HP
		2, --Armor
		7, --Evasion
		10, --EDef
		10, --HeatCap
		15, --Sensors
		12, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Seeder'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		0, --A
		3, --S
		0, --E
		14, --HP
		2, --Armor
		8, --Evasion
		10, --EDef
		10, --HeatCap
		15, --Sensors
		15, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Seeder'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		0, --A
		4, --S
		0, --E
		16, --HP
		2, --Armor
		9, --Evasion
		11, --EDef
		10, --HeatCap
		15, --Sensors
		18, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Seeder'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		2, --H
		1, --A
		1, --S
		1, --E
		16, --HP
		1, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		10, --Sensors
		10, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Sentinel'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		3, --H
		2, --A
		2, --S
		2, --E
		20, --HP
		1, --Armor
		11, --Evasion
		11, --EDef
		8, --HeatCap
		10, --Sensors
		12, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Sentinel'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		4, --H
		3, --A
		3, --S
		3, --E
		24, --HP
		1, --Armor
		11, --Evasion
		13, --EDef
		8, --HeatCap
		10, --Sensors
		14, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Sentinel'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		1, --A
		1, --S
		1, --E
		10, --HP
		0, --Armor
		10, --Evasion
		8, --EDef
		6, --HeatCap
		15, --Sensors
		11, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Sniper'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		2, --A
		3, --S
		1, --E
		12, --HP
		0, --Armor
		13, --Evasion
		9, --EDef
		6, --HeatCap
		15, --Sensors
		13, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Sniper'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		3, --A
		4, --S
		2, --E
		14, --HP
		0, --Armor
		16, --Evasion
		10, --EDef
		6, --HeatCap
		15, --Sensors
		15, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Sniper'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		3, --A
		1, --S
		0, --E
		10, --HP
		0, --Armor
		10, --Evasion
		8, --EDef
		7, --HeatCap
		5, --Sensors
		10, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Specter'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		5, --A
		2, --S
		1, --E
		10, --HP
		0, --Armor
		14, --Evasion
		10, --EDef
		7, --HeatCap
		5, --Sensors
		12, --Save
		5 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Specter'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		6, --A
		3, --S
		1, --E
		10, --HP
		0, --Armor
		18, --Evasion
		12, --EDef
		7, --HeatCap
		5, --Sensors
		14, --Save
		7 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Specter'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-2, --A
		0, --S
		2, --E
		15, --HP
		1, --Armor
		8, --Evasion
		8, --EDef
		8, --HeatCap
		10, --Sensors
		10, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Support'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-1, --A
		1, --S
		4, --E
		18, --HP
		1, --Armor
		10, --Evasion
		10, --EDef
		8, --HeatCap
		10, --Sensors
		12, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Support'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		1, --H
		-1, --A
		2, --S
		6, --E
		22, --HP
		1, --Armor
		12, --Evasion
		12, --EDef
		8, --HeatCap
		10, --Sensors
		14, --Save
		4 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Support'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-2, --H
		1, --A
		3, --S
		0, --E
		12, --HP
		0, --Armor
		10, --Evasion
		13, --EDef
		8, --HeatCap
		15, --Sensors
		12, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '1'
	WHERE a.Name = 'Witch'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		2, --A
		5, --S
		0, --E
		14, --HP
		0, --Armor
		12, --Evasion
		16, --EDef
		8, --HeatCap
		15, --Sensors
		15, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '2'
	WHERE a.Name = 'Witch'
	UNION
	SELECT
		a.NpcClassID,
		b.NpcTierID,
		-1, --H
		3, --A
		6, --S
		0, --E
		14, --HP
		0, --Armor
		14, --Evasion
		20, --EDef
		8, --HeatCap
		20, --Sensors
		18, --Save
		6 --Speed
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcTier b ON b.Tier = '3'
	WHERE a.Name = 'Witch'

END;
*/