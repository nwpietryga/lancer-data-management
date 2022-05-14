USE LANCER;
GO

CREATE TABLE dbo.NpcTemplateFeature (
	NpcTemplateID INT NOT NULL CONSTRAINT FK_NpcTemplateFeature_NpcTemplateID_NpcTemplate_NpcTemplateID FOREIGN KEY REFERENCES dbo.NpcTemplate(NpcTemplateID),
	FeatureID INT NOT NULL CONSTRAINT FK_NpcTemplateFeature_FeatureID_Feature_FeatureID FOREIGN KEY REFERENCES dbo.Feature(FeatureID)
);
GO

ALTER TABLE dbo.NpcTemplateFeature
ADD CONSTRAINT PK_NpcTemplateID_FeatureID PRIMARY KEY (NpcTemplateID, FeatureID);
GO