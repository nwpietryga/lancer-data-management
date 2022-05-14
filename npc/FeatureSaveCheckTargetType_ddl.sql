USE LANCER;
GO

CREATE TABLE dbo.FeatureSaveCheckTargetType ( --Add PK
	FeatureID INT NOT NULL CONSTRAINT FK_FeatureSaveCheckTargetType_FeatureID_Feature_FeatureID FOREIGN KEY REFERENCES dbo.Feature(FeatureID),
	SaveCheckTypeID INT NOT NULL CONSTRAINT FK_FeatureSaveCheckTargetType_SaveCheckTypeID_SaveCheckType_SaveCheckTypeID FOREIGN KEY REFERENCES dbo.SaveCheckType(SaveCheckTypeID),
	SaveCheckTargetID INT NOT NULL CONSTRAINT FK_FeatureSaveCheckTargetType_SaveCheckTargetID_SaveCheckTarget_SaveCheckTargetID FOREIGN KEY REFERENCES dbo.SaveCheckTarget(SaveCheckTargetID),
	OnFail VARCHAR(25), --damage, status, etc.
	OnSuccess VARCHAR(25)
);
GO