USE LANCER;
GO

CREATE TABLE dbo.NpcClassFeature (
	NpcClassID INT NOT NULL CONSTRAINT FK_NpcClassFeature_NpcClassID_NpcClass_NpcClassID FOREIGN KEY REFERENCES dbo.NpcClass(NpcClassID),
	FeatureID INT NOT NULL CONSTRAINT FK_NpcClassFeature_FeatureID_Feature_FeatureID FOREIGN KEY REFERENCES dbo.Feature(FeatureID),
	IsOptional BIT NOT NULL CONSTRAINT DF_NpcClassFeature_IsOptional_0 DEFAULT(0)
);
GO

ALTER TABLE dbo.NpcClassFeature ADD CONSTRAINT PK_NpcClassFeature_NpcClassID_FeatureID PRIMARY KEY (NpcClassID, FeatureID);
GO