CREATE
	OR REPLACE PROCEDURE pr_Enrollment_Load (YEAR FLOAT)
RETURNS STRING LANGUAGE javascript 
		AS $$ var sql_DelCommand = `DELETE
FROM Enrollment
WHERE AcademicYear = ` + YEAR.toString() + `;

` var sql_Command = `

INSERT INTO Enrollment (
	AcademicInstitutionUniqueDWSID
	,InstitutionIdentifier
	,AcademicYear
	,LevelOfStudent
	,OriginalLevelOfStudyOnSurveyForm
	,TotalMen
	,TotalWomen
	,WhiteMen
	,WhiteWomen
	,AfricanAmericanMen
	,AfricanAmericanWomen
	,AmericanIndianOrAlaskaNativeMen
	,AmericanIndianOrAlaskaNativeWomen
	,AsianMen
	,AsianWomen
	,HispanicOrLatinoMen
	,HispanicOrLatinoWomen
	,HawaiianPacificIslanderMen
	,HawaiianPacificIslanderWomen
	,NonresidentAlienMen
	,NonresidentAlienWomen
	,TwoOrMoreRacesMen
	,TwoOrMoreRacesWomen
	,RaceEthnicityUnknownMen
	,RaceEthnicityUnknownWomen
	,ImputationVarTotalMen
	,ImputationVarTotalWomen
	,ImputationVarWhiteMen
	,ImputationVarWhiteWomen
	,ImputationVarAfricanAmericanMen
	,ImputationVarAfricanAmericanWomen
	,ImputationVarAmericanIndianOrAlaskaNativeMen
	,ImputationVarAmericanIndianOrAlaskaNativeWomen
	,ImputationVarHispanicOrLatinoMen
	,ImputationVarHispanicOrLatinoWomen
	,ImputationVarAsianMen
	,ImputationVarAsianWomen
	,ImputationVarHawaiianPacificIslanderMen
	,ImputationVarHawaiianPacificIslanderWomen
	,ImputationVarNonresidentAlienMen
	,ImputationVarNonresidentAlienWomen
	,ImputationVarTwoOrMoreRacesMen
	,ImputationVarTwoOrMoreRacesWomen
	,ImputationVarRaceEthnicityUnknownMen
	,ImputationVarRaceEthnicityUnknownWomen
	,VariablesImputedCount
	,VariablesReportedCount
	)
SELECT IFNULL(D.AcademicInstitutionUniqueDWSID, - 1)
	,S.InstitutionIdentifier
	,S.AcademicYear
	,S.LevelOfStudent
	,S.OriginalLevelOfStudyOnSurveyForm
	,S.TotalMen
	,S.TotalWomen
	,S.WhiteMen
	,S.WhiteWomen
	,S.AfricanAmericanMen
	,S.AfricanAmericanWomen
	,S.AmericanIndianOrAlaskaNativeMen
	,S.AmericanIndianOrAlaskaNativeWomen
	,S.AsianMen
	,S.AsianWomen
	,S.HispanicOrLatinoMen
	,S.HispanicOrLatinoWomen
	,S.HawaiianPacificIslanderMen
	,S.HawaiianPacificIslanderWomen
	,S.NonresidentAlienMen
	,S.NonresidentAlienWomen
	,S.TwoOrMoreRacesMen
	,S.TwoOrMoreRacesWomen
	,S.RaceEthnicityUnknownMen
	,S.RaceEthnicityUnknownWomen
	,S.ImputationVarTotalMen
	,S.ImputationVarTotalWomen
	,S.ImputationVarWhiteMen
	,S.ImputationVarWhiteWomen
	,S.ImputationVarAfricanAmericanMen
	,S.ImputationVarAfricanAmericanWomen
	,S.ImputationVarAmericanIndianOrAlaskaNativeMen
	,S.ImputationVarAmericanIndianOrAlaskaNativeWomen
	,S.ImputationVarAsianMen
	,S.ImputationVarAsianWomen
	,S.ImputationVarHispanicOrLatinoMen
	,S.ImputationVarHispanicOrLatinoWomen
	,S.ImputationVarHawaiianPacificIslanderMen
	,S.ImputationVarHawaiianPacificIslanderWomen
	,S.ImputationVarNonresidentAlienMen
	,S.ImputationVarNonresidentAlienWomen
	,S.ImputationVarTwoOrMoreRacesMen
	,S.ImputationVarTwoOrMoreRacesWomen
	,S.ImputationVarRaceEthnicityUnknownMen
	,S.ImputationVarRaceEthnicityUnknownWomen
	,
	--- calculation
	(
	CASE 
		WHEN S.ImputationVarTotalMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarTotalWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarWhiteMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarWhiteWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAfricanAmericanMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAfricanAmericanWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAmericanIndianOrAlaskaNativeMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAmericanIndianOrAlaskaNativeWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAsianMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAsianWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHispanicOrLatinoMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHispanicOrLatinoWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarNonresidentAlienMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarNonresidentAlienWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHawaiianPacificIslanderMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHawaiianPacificIslanderWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarTwoOrMoreRacesMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarTwoOrMoreRacesWomen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarRaceEthnicityUnknownMen <> 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarRaceEthnicityUnknownWomen <> 'R'
			THEN 1
		ELSE 0
		END
	) AS VariablesImputedCount
	,(
	CASE 
		WHEN S.ImputationVarTotalMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarTotalWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarWhiteMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarWhiteWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAfricanAmericanMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAfricanAmericanWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAmericanIndianOrAlaskaNativeMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAmericanIndianOrAlaskaNativeWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAsianMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarAsianWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHispanicOrLatinoMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHispanicOrLatinoWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarNonresidentAlienMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarNonresidentAlienWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHawaiianPacificIslanderMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarHawaiianPacificIslanderWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarTwoOrMoreRacesMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarTwoOrMoreRacesWomen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarRaceEthnicityUnknownMen = 'R'
			THEN 1
		ELSE 0
		END + CASE 
		WHEN S.ImputationVarRaceEthnicityUnknownWomen = 'R'
			THEN 1
		ELSE 0
		END
	) AS VariablesReportedCount
FROM od_Enrollment S
INNER JOIN AcademicInstitution D ON S.InstitutionIdentifier = D.
	InstitutionIdentifier
WHERE S.ACADEMICYEAR = ` + YEAR.toString() var sql_UpdCommand = `

UPDATE Enrollment
SET ImputationVarPercent = VariablesImputedCount 
	/ (VariablesImputedCount + VariablesReportedCount
		)
	,ReportedVarPercent = VariablesReportedCount 
		/ (VariablesImputedCount + VariablesReportedCount
		)
WHERE ACADEMICYEAR = ` + YEAR.toString() var arrSqlCmd = [3];

arrSqlCmd [0] = sql_DelCommand arrSqlCmd [1] = sql_Command arrSqlCmd [2] = 
	sql_UpdCommand var sql_ExecCommand = '';
FOR (var j = 0;j < arrSqlCmd.length;j + +)

{ sql_ExecCommand = arrSqlCmd [j] try { snowflake.

EXECUTE ({sqlText: sql_ExecCommand});

} catch(err) {

RETURN "Failed :" + err;

} }

RETURN "success" $$;
