USE LANCER;
GO

CREATE TABLE pilot.PilotTalent (
	PilotID INT NOT NULL CONSTRAINT FK_PilotTalent_PilotID_Pilot_PilotID FOREIGN KEY REFERENCES pilot.Pilot(PilotID),
	TalentID INT NOT NULL CONSTRAINT FK_PilotTalent_TalentID_Talent_TalentID FOREIGN KEY REFERENCES pilot.Talent(TalentID)
);
GO

ALTER TABLE pilot.PilotTalent
ADD CONSTRAINT PK_PilotTalent_PilotID_TalentID PRIMARY KEY (PilotID, TalentID);
GO