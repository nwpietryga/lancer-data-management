USE LANCER;
GO

CREATE TABLE pilot.PilotLicense (
	PilotID INT NOT NULL CONSTRAINT FK_PilotLicense_PilotID_Pilot_PilotID FOREIGN KEY REFERENCES pilot.Pilot(PilotID),
	LicenseID INT NOT NULL CONSTRAINT FK_PilotLicense_LicenseID_License_LicenseID FOREIGN KEY REFERENCES pilot.License(LicenseID)
);
GO

ALTER TABLE pilot.PilotLicense
ADD CONSTRAINT PK_PilotLicense_PilotID_LicenseID PRIMARY KEY (PilotID, LicenseID);
GO