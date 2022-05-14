USE LANCER;
GO

CREATE TABLE dbo.NpcClassGroup (
	NpcClassID INT NOT NULL CONSTRAINT FK_NpcClassGroup_NpcClassID_NpcClass_NpcClassID FOREIGN KEY REFERENCES NpcClass(NpcClassID),
	NpcGroupID INT NOT NULL CONSTRAINT FK_NpcClassGroup_NpcGroupID_NpcGroup_NpcGroupID FOREIGN KEY REFERENCES NpcGroup(NpcGroupID)
);
GO

ALTER TABLE dbo.NpcClassGroup
ADD CONSTRAINT PK_NpcClassGroup_NpcClassID_NpcGroupID PRIMARY KEY (NpcClassID, NpcGroupID);
GO

/*
IF NOT EXISTS (
	SELECT TOP 1 1
	FROM dbo.NpcClassGroup
)
BEGIN
	INSERT INTO dbo.NpcClassGroup (
		NpcClassID,
		NpcGroupID
	)
	SELECT
		a.NpcClassID,
		b.NpcGroupID
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcGroup b ON b.Name = 'Striker'
	WHERE a.Name IN ('Ace', 'Assassin', 'Assault', 'Berserker', 'Breacher', 'Cataphract', 'Engineer', 'Ronin', 'Specter', 'Scourer')
	UNION
	SELECT
		a.NpcClassID,
		b.NpcGroupID
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcGroup b ON b.Name = 'Controller'
	WHERE a.Name IN ('Archer', 'Barricade', 'Hive', 'Hornet', 'Seeder', 'Witch')
	UNION
	SELECT
		a.NpcClassID,
		b.NpcGroupID
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcGroup b ON b.Name = 'Defender'
	WHERE a.Name IN ('Bastion', 'Demolisher', 'Goliath', 'Pyro', 'Sentinel')
	UNION
	SELECT
		a.NpcClassID,
		b.NpcGroupID
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcGroup b ON b.Name = 'Artillery'
	WHERE a.Name IN ('Bombard', 'Operator', 'Rainmaker', 'Sniper')
	UNION
	SELECT
		a.NpcClassID,
		b.NpcGroupID
	FROM dbo.NpcClass a
	INNER JOIN dbo.NpcGroup b ON b.Name = 'Support'
	WHERE a.Name IN ('Aegis', 'Mirage', 'Priest', 'Scout', 'Support')
END;
GO
*/