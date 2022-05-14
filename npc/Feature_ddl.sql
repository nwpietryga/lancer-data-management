USE LANCER;
GO

CREATE TABLE dbo.Feature (
	FeatureID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Feature_FeatureID PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	FeatureTypeID INT NOT NULL CONSTRAINT FK_Feature_FeatureTypeID_FeatureType_FeatureTypeID FOREIGN KEY REFERENCES dbo.FeatureType(FeatureTypeID),
	FeatureTierID INT CONSTRAINT FK_Feature_FeatureTierID_NpcTier_NpcTierID FOREIGN KEY REFERENCES dbo.NpcTier(NpcTierID),
	ActionTypeID INT NOT NULL CONSTRAINT FK_Feature_ActionTypeID_ActionType_ActionTypeID FOREIGN KEY REFERENCES dbo.ActionType(ActionTypeID),
	FeatureUseID INT CONSTRAINT FK_Feature_FeatureUseID_FeatureUse_FeatureUseID FOREIGN KEY REFERENCES dbo.FeatureUse(FeatureUseID),
	[Range] VARCHAR(10), --int value, self, sensors
	Threat TINYINT,
	AccuracySelf INT, --negative is difficulty
	AccuracyTarget INT, 
	FlatModifier INT,
	Description VARCHAR(250)
);
GO