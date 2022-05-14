USE LANCER;
GO

CREATE TABLE dbo.ActionType (
	ActionTypeID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ActionType_ActionTypeID PRIMARY KEY,
	Name VARCHAR(15) NOT NULL --quick, full, free, protocol, etc.
);
GO

/*
INSERT INTO dbo.ActionType (
	Name
)
VALUES
('Quick'),
('Full'),
('Free'),
('Protocol'),
('Reaction'),
('Passive');
*/