CREATE OR REPLACE PROCEDURE 
	pr_InstitutionalCharge_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
EXECUTE AS OWNER
AS
$$
var sql_DelCommand = `DELETE FROM InstitutionalCharge 
	WHERE AcademicYear = `+ YEAR.toString() +`;`
var sql_Command =
`INSERT INTO
InstitutionalCharge 
(AcademicInstitutionUniqueDWSID, 
InstitutionIdentifier, 
AcademicYear,
InDistrictAverageTuitionFullTimeUndergraduates,
InDistrictRequiredFeesFullTimeUndergraduates,
InDistrictPerCreditHourChargeForPartTimeUndergraduates,
InStateAverageTuitionFullTimeUndergraduates,
InStateRequiredFeesFullTimeUndergraduates,
InStatePerCreditHourChargeForPartTimeUndergraduates,
OutOfStateAverageTuitionFullTimeUndergraduates,
OutOfStateRequiredFeesFullTimeUndergraduates,
OutOfStatePerCreditHourChargeForPartTimeUndergraduates,
InDistrictAverageTuitionFullTimeGraduates,
InDistrictRequiredFeesFullTimeGraduates,
InDistrictPerCreditHourChargePartTimeGraduates,
InStateAverageTuitionFullTimeGraduates,
InStateRequiredFeesFullTimeGraduates,
InStatePerCreditHourChargePartTimeGraduates,
OutOfStateAverageTuitionFullTimeGraduates,
OutOfStateRequiredFeesFullTimeGraduates,
OutOfStatePerCreditHourChargePartTimeGraduate,  
PublishedInStateTuitionGuaranteedPercentIncrease,
PublishedInStateFeesGuaranteedPercentIncrease,
PublishedOutOfStateTuitionGuaranteedPercentIncrease,
PublishedOutOfStateFeesGuaranteedPercentIncrease
) 
SELECT
IFNULL(D.AcademicInstitutionUniqueDWSID, - 1),
S.InstitutionIdentifier,
S.AcademicYear,
S.InDistrictAverageTuitionFullTimeUndergraduates,
S.InDistrictRequiredFeesFullTimeUndergraduates,
S.InDistrictPerCreditHourChargeForPartTimeUndergraduates,
S.InStateAverageTuitionFullTimeUndergraduates,
S.InStateRequiredFeesFullTimeUndergraduates,
S.InStatePerCreditHourChargeForPartTimeUndergraduates,
S.OutOfStateAverageTuitionFullTimeUndergraduates,
S.OutOfStateRequiredFeesFullTimeUndergraduates,
S.OutOfStatePerCreditHourChargeForPartTimeUndergraduates,
S.InDistrictAverageTuitionFullTimeGraduates,
S.InDistrictRequiredFeesFullTimeGraduates,
S.InDistrictPerCreditHourChargePartTimeGraduates,
S.InStateAverageTuitionFullTimeGraduates,
S.InStateRequiredFeesFullTimeGraduates,
S.InStatePerCreditHourChargePartTimeGraduates,
S.OutOfStateAverageTuitionFullTimeGraduates,
S.OutOfStateRequiredFeesFullTimeGraduates,
S.OutOfStatePerCreditHourChargePartTimeGraduate,  
S.PublishedInStateTuitionGuaranteedPercentIncrease,
S.PublishedInStateFeesGuaranteedPercentIncrease,
S.PublishedOutOfStateTuitionGuaranteedPercentIncrease,
S.PublishedOutOfStateFeesGuaranteedPercentIncrease
FROM
  od_InstitutionalCharge S
LEFT OUTER JOIN AcademicInstitution D 
	ON S.InstitutionIdentifier = D.InstitutionIdentifier
WHERE S.AcademicYear = ` + YEAR.toString() +`;`

var arrSqlCmd =[2];
arrSqlCmd[0] = sql_DelCommand
arrSqlCmd[1] = sql_Command
var sql_ExecCommand ='';
for (var j=0;j<arrSqlCmd.length; j++)
{
	sql_ExecCommand = arrSqlCmd[j] 
	try
	{  
		snowflake.execute(
			{sqlText: sql_ExecCommand}
		);
  }
	catch(err)
	{
		return "Failed :" + err;
	}
}
return "success"
$$;
