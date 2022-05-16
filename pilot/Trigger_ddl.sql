USE LANCER;
GO

CREATE TABLE pilot.[Trigger] (
	TriggerID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Trigger_TriggerID PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
);
GO

/*
INSERT INTO pilot.[Trigger] (
	Name
)
VALUES
('Act Unseen or Unheard'),
('Apply Fists to Faces'),
('Assault'),
('Blow Something Up'),
('Charm'),
('Get Ahold of Something'),
('Get Somewhere Quickly'),
('Hack or Fix'),
('Invent or Create'),
('Investigate'),
('Lead or Inspire'),
('Patch'),
('Pull Rank'),
('Read a Situation'),
('Show Off'),
('Spot'),
('Stay Cool'),
('Survive'),
('Take Control'),
('Take Someone Out'),
('Threaten'),
('Word on the Street')
*/