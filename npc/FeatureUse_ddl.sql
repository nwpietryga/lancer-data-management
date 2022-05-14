USE LANCER;
GO

CREATE TABLE dbo.FeatureUse (
	FeatureUseID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_FeatureUse_FeatureUseID PRIMARY KEY,
	UseStock TINYINT, --Number of uses overall
	UseCount TINYINT NOT NULL, --Number of uses per cadence
	UseCadence VARCHAR(10) NOT NULL, --round, turn, scene, etc.
	AppendText VARCHAR(50) --Recharge, etc.
);
GO