USE LANCER;
GO

CREATE TABLE dbo.FeatureDamage ( --Add PK
	FeatureID INT NOT NULL CONSTRAINT FK_FeatureDamage_FeatureID_Feature_FeatureID FOREIGN KEY REFERENCES dbo.Feature(FeatureID),
	DamageTypeID INT NOT NULL CONSTRAINT FK_FeatureDamage_DamageTypeID_DamageType_DamageTypeID FOREIGN KEY REFERENCES dbo.DamageType(DamageTypeID),
	Damage INT NOT NULL
);
GO