USE LANCER;
GO

CREATE TABLE pilot.PilotTrigger (
	PilotID INT NOT NULL CONSTRAINT FK_PilotTrigger_PilotID_Pilot_PilotID FOREIGN KEY REFERENCES pilot.Pilot(PilotID),
	TriggerID INT NOT NULL CONSTRAINT FK_PilotTrigger_TriggerID_Trigger_TriggerID FOREIGN KEY REFERENCES pilot.[Trigger](TriggerID),
	Value TINYINT NOT NULL
);
GO

ALTER TABLE pilot.PilotTrigger
ADD CONSTRAINT PK_PilotTrigger_PilotID_TriggerID PRIMARY KEY (PilotID, TriggerID);
GO