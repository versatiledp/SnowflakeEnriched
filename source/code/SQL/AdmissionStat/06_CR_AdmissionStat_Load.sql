CREATE OR REPLACE PROCEDURE 
	pr_AdmissionStat_Load (YEAR FLOAT)
RETURNS string
LANGUAGE javascript
EXECUTE AS OWNER
AS
$$
var sql_DelCommand = 
`DELETE FROM AdmissionStat WHERE AcademicYear = `+ YEAR.toString()
var sql_Command =
`
INSERT INTO
AdmissionStat 
( 
AcademicInstitutionUniqueDWSID, 
InstitutionIdentifier, 
AcademicYear  ,
SecondarySchoolGPA, 
SecondarySchoolRank, 
SecondarySchoolRecord, 
CompletionOfCollegePreparatoryProgram, 
Recommendations, 
FormalDemonstrationOfCompetencies, 
AdmissionTestScores, 
Toefl, 
OtherTest, 
ApplicantsTotal, 
ApplicantsMen, 
ApplicantsWomen, 
AdmissionsTotal, 
AdmissionsMen, 
AdmissionsWomen, 
EnrolledTotal, 
EnrolledMen, 
EnrolledWomen, 
EnrolledFullTimeTotal, 
EnrolledFullTimeMen, 
EnrolledFullTimeWomen, 
EnrolledPartTimeTotal, 
EnrolledPartTimeMen, 
EnrolledPartTimeWomen, 
FirstTimeDegreeOrCertificateSeekingStudentsSubmittingSATScores,
PercentFirstTimeDegreeOrCertificateSeekingStudentsSubmittingSATScores,
FirstTimeDegreeOrCertificateSeekingStudentsSubmittingACTScores,
PercentOfFirstTimeDegreeOrCertificateSeekingStudentsSubmittingACTScores,
SATEvidenceBasedReadingWriting25thPercentileScore, 
SATEvidenceBasedReadingWriting75thPercentileScore, 
SATMath25thPercentileScore, 
SATMath75thPercentileScore, 
ACTComposite25thPercentileScore, 
ACTComposite75thPercentileScore, 
ACTEnglish25thPercentileScore, 
ACTEnglish75thPercentileScore, 
ACTMath25thPercentileScore, 
ACTMath75thPercentileScore) 
SELECT
IFNULL(D.AcademicInstitutionUniqueDWSID, - 1),
S.InstitutionIdentifier,
S.AcademicYear ,
S.SecondarySchoolGPA,
S.SecondarySchoolRank,
S.SecondarySchoolRecord,
S.CompletionOfCollegePreparatoryProgram,
S.Recommendations,
S.FormalDemonstrationOfCompetencies,
S.AdmissionTestScores,
S.Toefl,
S.OtherTest,
S.ApplicantsTotal,
S.ApplicantsMen,
S.ApplicantsWomen,
S.AdmissionsTotal,
S.AdmissionsMen,
S.AdmissionsWomen,
S.EnrolledTotal,
S.EnrolledMen,
S.EnrolledWomen,
S.EnrolledFullTimeTotal,
S.EnrolledFullTimeMen,
S.EnrolledFullTimeWomen,
S.EnrolledPartTimeTotal,
S.EnrolledPartTimeMen,
S.EnrolledPartTimeWomen,
S.FirstTimeDegreeOrCertificateSeekingStudentsSubmittingSATScores,
S.PercentFirstTimeDegreeOrCertificateSeekingStudentsSubmittingSATScores,
S.FirstTimeDegreeOrCertificateSeekingStudentsSubmittingACTScores,
S.PercentOfFirstTimeDegreeOrCertificateSeekingStudentsSubmittingACTScores,
S.SATEvidenceBasedReadingWriting25thPercentileScore,
S.SATEvidenceBasedReadingWriting75thPercentileScore,
S.SATMath25thPercentileScore,
S.SATMath75thPercentileScore,
S.ACTComposite25thPercentileScore,
S.ACTComposite75thPercentileScore,
S.ACTEnglish25thPercentileScore,
S.ACTEnglish75thPercentileScore,
S.ACTMath25thPercentileScore,
S.ACTMath75thPercentileScore
FROM
od_AdmissionStat S
LEFT OUTER JOIN AcademicInstitution D 
	ON S.InstitutionIdentifier = D.InstitutionIdentifier
WHERE S.AcademicYear = ` + YEAR.toString() 

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
