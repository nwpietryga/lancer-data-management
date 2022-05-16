USE LANCER;
GO

CREATE TABLE pilot.Background (
	BackgroundID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Background_BackgroundID PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
);

/*
INSERT INTO pilot.Background (
	Name
)
VALUES
('Assassin'),
('Bodyguard'),
('Celebrity'),
('Criminal'),
('Colonist'),
('Detective'),
('Doctor'),
('Star Drive Technician'),
('Farmer'),
('Spacer'),
('Hacker'),
('Marine'),
('Mechanic'),
('Mercenary'),
('Miner'),
('NHP Specialist'),
('Noble'),
('Officer'),
('Outlander'),
('Penal Colonist'),
('Pirate'),
('Politician'),
('Priest'),
('Rebel'),
('Security'),
('Scientist'),
('Smuggler'),
('Soldier'),
('Spy'),
('Spec Ops'),
('Super Soldier'),
('Survey Corps'),
('Starship Pilot');
*/