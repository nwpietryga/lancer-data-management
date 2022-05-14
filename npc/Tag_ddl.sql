USE LANCER;
GO

CREATE TABLE dbo.Tag (
	TagID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Tag_TagID PRIMARY KEY,
	Name VARCHAR(25) NOT NULL --smart, loading, etc
);
GO

/*
INSERT INTO dbo.Tag (
	Name
)
VALUES
('Auxiliary'),
('Main'),
('Heavy'),
('Superheavy'),
('Melee'),
('CQB'),
('Rifle'),
('Launcher'),
('Cannon'),
('Nexus'),
('Accurate'),
('Arcing'),
('AP'),
('Inaccurate'),
('Knockback'),
('Loading'),
('Ordnance'),
('Overkill'),
('Overshield'),
('Reliable'),
('Seeking'),
('Smart'),
('Threat'),
('Thrown'),
('AI'),
('Drone'),
('Invade'),
('Grenade'),
('Mine'),
('Mod'),
('Shield'),
('System'),
('Unique'),
('Exotic')
;
GO
*/