USE LANCER;
GO
--==--==--==--==--==
--Adds Feature information in all relevant tables
--Order:
--	FeatureUse
--	Feature
--	FeatureTag
--	FeatureSaveCheckTargetType
--	FeaturePattern
--	FeatureDamage
--
--Ex. EXEC dbo.AddFeature 
--		'Bombing Bay', --Name
--		'System',
--		'1', --Tier (Future development: multiple tiers in one run)
--		'Free',
--		'3,1,Round,Recharge 5',
--		'1', --Range
--		NULL,
--		NULL,
--		NULL,
--		NULL,
--		'<Text goes here>',
--		NULL, --FeatureTag values, comma-delimited in entry, semicolon-delimited between entries, ex. 'Main; Melee; Thrown, 5'
--		'Agility Save, Damage/Prone, NULL', --FeatureSaveCheckTargetType, comma-delimited in entry, semicolon-delimited between entries, / denotes multiple effects
--		'Blast 1', --FeaturePattern (Future development: multiple pattern profiles in one run)
--		'3 Explosive' --FeatureDamage (Future development: multiple damage types in one action)
--==--==--==--==--==
CREATE OR ALTER PROCEDURE dbo.AddFeature (
	@Name VARCHAR(50),
	@FeatureType VARCHAR(25),
	@FeatureTier VARCHAR(10),
	@ActionType VARCHAR(15),
	@FeatureUseTraits VARCHAR(75),
	@Range VARCHAR(10),
	@Threat TINYINT,
	@AccuracySelf INT,
	@AccuracyTarget INT,
	@FlatModifier INT,
	@Description VARCHAR(250),
	@FeatureTag VARCHAR(100),
	@FeatureSaveCheckTargetType VARCHAR(250),
	@FeaturePattern VARCHAR(100),
	@FeatureDamage VARCHAR(100)
)
AS
BEGIN

	--Do we bother going forward
	IF EXISTS (
		SELECT TOP 1 1
		FROM dbo.Feature a
		WHERE a.Name = @Name
			AND ISNULL(a.FeatureTierID, -1) = (
				SELECT ISNULL(b.NpcTierID, -1)
				FROM dbo.NpcTier b
				WHERE b.Tier = @FeatureTier
			)
	)
		RETURN 'It looks like that already exists!'

	--Set up our variables
	DECLARE
		--Feature
		@FeatureID INT,
		@FeatureTypeID INT,
		@FeatureTierID INT,
		@ActionTypeID INT,
		@FeatureTagID INT,
		@AppendText VARCHAR(50),
		--Tags
		@FeatureUseID INT,
		@FeatureTagHoldID INT,
		--Usage
		@FeatureUseStock INT,
		@FeatureUseCount INT,
		@FeatureUseCadence VARCHAR(10),
		@FeatureUseAppendText VARCHAR(50),
		--Save/Check
		@FeatureSaveCheckTargetTypeHoldID INT,
		@SaveCheckTarget VARCHAR(15),
		@SaveCheckTargetID INT,
		@SaveCheckType VARCHAR(15),
		@SaveCheckTypeID INT,
		@SaveCheckFail VARCHAR(25),
		@SaveCheckSuccess VARCHAR(25),
		--Pattern
		@PatternID INT,
		--Damage
		@DamageTypeID INT;

	--Check for FeatureUse
	DECLARE @FeatureUseHold TABLE (
		ID INT IDENTITY(1,1) NOT NULL,
		FeatureVal VARCHAR(15)
	);

	INSERT INTO @FeatureUseHold (
		FeatureVal
	)
	SELECT [value]
	FROM STRING_SPLIT(@FeatureUseTraits, ',');

	SELECT
		@FeatureUseStock = IIF(TRIM([1]) = 'NULL', NULL, TRIM([1])), --Stock
		@FeatureUseCount = TRIM([2]), --Count
		@FeatureUseCadence = TRIM([3]), --Cadence
		@FeatureUseAppendText = IIF(TRIM([4]) = 'NULL', NULL, TRIM([4])) --Append
	FROM (
		SELECT
			ID,
			FeatureVal
		FROM @FeatureUseHold
	) AS FUH
	PIVOT (
		MAX(FeatureVal)
		FOR ID IN ([1], [2], [3], [4])
	) AS pvt;

	BEGIN TRY

		IF NOT EXISTS (
			SELECT TOP 1 1
			FROM dbo.FeatureUse a
			WHERE ISNULL(a.UseStock, 255) = ISNULL(@FeatureUseStock, 255)
				AND a.UseCount = @FeatureUseCount
				AND a.UseCadence = @FeatureUseCadence
				AND ISNULL(a.AppendText, '') = ISNULL(@FeatureUseAppendText, '')
		)
			AND (SELECT @FeatureUseTraits) IS NOT NULL
		BEGIN

			PRINT('Adding FeatureUse')

			INSERT INTO dbo.FeatureUse (
				UseStock,
				UseCount,
				UseCadence,
				AppendText
			)
			SELECT
				@FeatureUseStock,
				@FeatureUseCount,
				@FeatureUseCadence,
				@FeatureUseAppendText;

			SELECT @FeatureUseID = IDENT_CURRENT('dbo.FeatureUse');
		END;
		ELSE
		BEGIN
			
			PRINT('Retrieving FeatureUse')

			SELECT @FeatureUseID = a.FeatureUseID
			FROM dbo.FeatureUse a
			WHERE ISNULL(a.UseStock, 255) = ISNULL(@FeatureUseStock, 255)
				AND a.UseCount = @FeatureUseCount
				AND a.UseCadence = @FeatureUseCadence
				AND ISNULL(a.AppendText, '') = ISNULL(@AppendText, '');

		END;

		--Feature
		/*
		FUTURE DEVELOPMENT - multiple tiers at once
		IF (SELECT CHARINDEX(',', @FeatureTier)) > 0
		BEGIN
		END
		*/
		PRINT('Starting Feature');

		SELECT @FeatureTypeID = a.FeatureTypeID
		FROM dbo.FeatureType a
		WHERE a.Name = @FeatureType;

		IF (SELECT @FeatureTier) IS NOT NULL
			SELECT @FeatureTierID = a.NpcTierID
			FROM dbo.NpcTier a
			WHERE a.Tier = @FeatureTier;

		SELECT @ActionTypeID = a.ActionTypeID
		FROM dbo.ActionType a
		WHERE a.Name = @ActionType;

		INSERT INTO dbo.Feature (
			Name,
			FeatureTypeID,
			FeatureTierID,
			ActionTypeID,
			FeatureUseID,
			[Range],
			Threat,
			AccuracySelf,
			AccuracyTarget,
			FlatModifier,
			[Description]
		)
		SELECT
			@Name,
			@FeatureTypeID,
			@FeatureTierID,
			@ActionTypeID,
			@FeatureUseID,
			@Range,
			@Threat,
			@AccuracySelf,
			@AccuracyTarget,
			@FlatModifier,
			@Description;

		SELECT @FeatureID = IDENT_CURRENT('dbo.Feature');

		--FeatureTag
		IF (SELECT @FeatureTag) IS NOT NULL
		BEGIN

			PRINT('Starting Tag')

			DECLARE @FeatureTagHold TABLE (
				ID INT IDENTITY(1,1) NOT NULL,
				FeatureVal VARCHAR(50)
			);

			INSERT INTO @FeatureTagHold (
				FeatureVal
			)
			SELECT [value]
			FROM STRING_SPLIT(@FeatureTag, ';');

			WHILE EXISTS (SELECT TOP 1 1 FROM @FeatureTagHold)
			BEGIN

				SELECT TOP 1
					@FeatureTagHoldID = a.ID,
					@FeatureTag = IIF(CHARINDEX(',', a.FeatureVal) = 0, a.FeatureVal, TRIM(SUBSTRING(a.FeatureVal, 0, CHARINDEX(',', a.FeatureVal)))),
					@AppendText = IIF(CHARINDEX(',', a.FeatureVal) = 0, NULL, TRIM(SUBSTRING(a.FeatureVal, CHARINDEX(',', a.FeatureVal) + 1, LEN(a.FeatureVal))))
				FROM @FeatureTagHold a
				ORDER BY a.ID;

				SELECT @FeatureTagID = a.TagID
				FROM dbo.Tag a
				WHERE a.Name = @FeatureTag;

				INSERT INTO dbo.FeatureTag (
					FeatureID,
					TagID,
					AppendText
				)
				SELECT
					@FeatureID,
					@FeatureTagID,
					@AppendText;

				DELETE a
				FROM @FeatureTagHold a
				WHERE a.ID = @FeatureTagHoldID;

			END;
		END;

		--FeatureSaveCheckTargetType
		IF (SELECT @FeatureSaveCheckTargetType) IS NOT NULL
		BEGIN

			PRINT('Starting Save/Check')

			DECLARE @FeatureSaveCheckTargetTypeHold TABLE (
				ID INT IDENTITY(1,1) NOT NULL,
				FeatureVal VARCHAR(50)
			);

			INSERT INTO @FeatureSaveCheckTargetTypeHold (
				FeatureVal
			)
			SELECT [value]
			FROM STRING_SPLIT(@FeatureSaveCheckTargetType, ';');

			WHILE EXISTS (SELECT TOP 1 1 FROM @FeatureSaveCheckTargetTypeHold)
			BEGIN
		
				SELECT TOP 1
					@FeatureSaveCheckTargetTypeHoldID = a.ID,
					@SaveCheckTarget = SUBSTRING(a.FeatureVal, 0, CHARINDEX(' ', a.FeatureVal)),
					@SaveCheckType = SUBSTRING(a.FeatureVal, CHARINDEX(' ', a.FeatureVal) + 1, CHARINDEX(',', a.FeatureVal) - CHARINDEX(' ', a.FeatureVal) - 1),
					@SaveCheckFail = SUBSTRING(
											a.FeatureVal, 
											CHARINDEX(',', a.FeatureVal) + 2, 
											CHARINDEX(',', a.FeatureVal, CHARINDEX(',', a.FeatureVal, 1) + 1) - CHARINDEX(',', a.FeatureVal) 
										),
					@SaveCheckSuccess = SUBSTRING(
											a.FeatureVal,
											CHARINDEX(',', a.FeatureVal, CHARINDEX(',', a.FeatureVal, 1) + 1) + 2,
											LEN(a.FeatureVal)
										)
				FROM @FeatureSaveCheckTargetTypeHold a
				ORDER BY a.ID;

				SELECT @SaveCheckTargetID = a.SaveCheckTargetID
				FROM dbo.SaveCheckTarget a
				WHERE a.Name = @SaveCheckTarget;

				SELECT @SaveCheckTypeID = a.SaveCheckTypeID
				FROM dbo.SaveCheckType a
				WHERE a.Name = @SaveCheckType;

				INSERT INTO dbo.FeatureSaveCheckTargetType (
					FeatureID,
					SaveCheckTypeID,
					SaveCheckTargetID,
					OnFail,
					OnSuccess
				)
				SELECT
					@FeatureID,
					@SaveCheckTypeID,
					@SaveCheckTargetID,
					IIF(@SaveCheckFail = 'NULL', NULL, @SaveCheckFail),
					IIF(@SaveCheckSuccess = 'NULL', NULL, @SaveCheckSuccess);

				DELETE a
				FROM @FeatureSaveCheckTargetTypeHold a
				WHERE a.ID = @FeatureSaveCheckTargetTypeHoldID;

			END;
		END;

		--FeaturePattern
		IF (SELECT @FeaturePattern) IS NOT NULL
		BEGIN

			PRINT('Starting Pattern');

			SELECT @PatternID = a.PatternID
			FROM dbo.Pattern a
			WHERE a.Name = SUBSTRING(@FeaturePattern, 0, CHARINDEX(' ', @FeaturePattern));

			SELECT @AppendText = SUBSTRING(@FeaturePattern, CHARINDEX(' ', @FeaturePattern) + 1, LEN(@FeaturePattern));

			INSERT INTO FeaturePattern (
				FeatureID,
				PatternID,
				AppendText
			)
			SELECT
				@FeatureID,
				@PatternID,
				@AppendText;

		END;

		--FeatureDamage
		IF (SELECT @FeatureDamage) IS NOT NULL
		BEGIN

			PRINT('Starting Damage')

			SELECT @DamageTypeID = a.DamageTypeID
			FROM dbo.DamageType a
			WHERE a.Name = SUBSTRING(@FeatureDamage, CHARINDEX(' ', @FeatureDamage) + 1, LEN(@FeatureDamage));

			INSERT INTO dbo.FeatureDamage (
				FeatureID,
				DamageTypeID,
				Damage
			)
			SELECT
				@FeatureID,
				@DamageTypeID,
				CONVERT(INT, SUBSTRING(@FeatureDamage, 0, CHARINDEX(' ', @FeatureDamage)));

		END;

	END TRY
	BEGIN CATCH
		THROW;
		--ROLLBACK TRANSACTION;
	END CATCH;

END;
GO