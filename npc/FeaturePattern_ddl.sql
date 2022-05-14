USE LANCER;
GO

CREATE TABLE dbo.FeaturePattern (
	FeatureID INT NOT NULL CONSTRAINT FK_FeaturePattern_FeatureID_Feature_FeatureID FOREIGN KEY REFERENCES dbo.Feature(FeatureID),
	PatternID INT NOT NULL CONSTRAINT FK_FeaturePattern_PatternID_Pattern_PatternID FOREIGN KEY REFERENCES dbo.Pattern(PatternID),
	AppendText VARCHAR(50) --Pattern size, width, etc.
);
GO
