USE LANCER;
GO

CREATE TABLE dbo.FeatureTag ( --Add PK
	FeatureID INT NOT NULL CONSTRAINT FK_FeatureTag_FeatureID_Feature_FeatureID FOREIGN KEY REFERENCES dbo.Feature(FeatureID),
	TagID INT NOT NULL CONSTRAINT FeatureTag_TagID_Tag_TagID FOREIGN KEY REFERENCES dbo.Tag(TagID),
	AppendText VARCHAR(50) --Ex. TagID corresponds to Thrown, specify range here
);
GO