CREATE OR REPLACE PROCEDURE pr_od_AdmissionStat_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
EXECUTE AS OWNER
AS
$$
var sql_command = `
INSERT INTO od_AdmissionStat 
 (
  InstitutionIdentifier,
  SecondarySchoolGPA,
  SecondarySchoolRank,
  SecondarySchoolRecord,
  CompletionOfCollegePreparatoryProgram,
  Recommendations,
  FormalDemonstrationOfCompetencies,
  AdmissionTestScores,
  TOEFL,
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
  ACTMath75thPercentileScore,
  AcademicYear,
  IngestedFileName,
  RowNumber
)
SELECT 
$1:UNITID::INTEGER AS InstitutionIdentifier, 
$1:ADMCON1::INTEGER AS SecondarySchoolGPA, 
$1:ADMCON2::INTEGER AS SecondarySchoolRank, 
$1:ADMCON3::INTEGER AS SecondarySchoolRecord, 
$1:ADMCON4::INTEGER AS CompletionOfCollegePreparatoryProgram, 
$1:ADMCON5::INTEGER AS Recommendations, 
$1:ADMCON6::INTEGER AS FormalDemonstrationOfCompetencies, 
$1:ADMCON7::INTEGER AS AdmissionTestScores, 
$1:ADMCON8::INTEGER AS Toefl, 
$1:ADMCON9::INTEGER AS OtherTest, 
$1:APPLCN::INTEGER AS ApplicantsTotal, 
$1:APPLCNM::INTEGER AS ApplicantsMen, 
$1:APPLCNW::INTEGER AS ApplicantsWomen, 
$1:ADMSSN::INTEGER AS AdmissionsTotal, 
$1:ADMSSNM::INTEGER AS AdmissionsMen, 
$1:ADMSSNW::INTEGER AS AdmissionsWomen, 
$1:ENRLT::INTEGER AS EnrolledTotal, 
$1:ENRLM::INTEGER AS EnrolledMen, 
$1:ENRLW::INTEGER AS EnrolledWomen, 
$1:ENRLFT::INTEGER AS EnrolledFullTimeTotal, 
$1:ENRLFTM::INTEGER AS EnrolledFullTimeMen, 
$1:ENRLFTW::INTEGER AS EnrolledFullTimeWomen, 
$1:ENRLPT::INTEGER AS EnrolledPartTimeTotal, 
$1:ENRLPTM::INTEGER AS EnrolledPartTimeMen, 
$1:ENRLPTW::INTEGER AS EnrolledPartTimeWomen, 
$1:SATNUM::INTEGER AS 
FirstTimeDegreeOrCertificateSeekingStudentsSubmittingSATScores,
$1:SATPCT::INTEGER AS 
PercentFirstTimeDegreeOrCertificateSeekingStudentsSubmittingSATScores, 
$1:ACTNUM::INTEGER AS 
FirstTimeDegreeOrCertificateSeekingStudentsSubmittingACTScores, 
$1:ACTPCT::INTEGER AS 
PercentOfFirstTimeDegreeOrCertificateSeekingStudentsSubmittingACTScores, 
$1:SATVR25::INTEGER AS 
SATEvidenceBasedReadingWriting25thPercentileScore, 
$1:SATVR75::INTEGER AS SATEvidenceBasedReadingWriting75thPercentileScore, 
$1:SATMT25::INTEGER AS SATMath25thPercentileScore, 
$1:SATMT75::INTEGER AS SATMath75thPercentileScore, 
$1:ACTCM25::INTEGER AS ACTComposite25thPercentileScore, 
$1:ACTCM75::INTEGER AS ACTComposite75thPercentileScore, 
$1:ACTEN25::INTEGER AS ACTEnglish25thPercentileScore, 
$1:ACTEN75::INTEGER AS ACTEnglish75thPercentileScore, 
$1:ACTMT25::INTEGER AS ACTMath25thPercentileScore, 
$1:ACTMT75::INTEGER AS ACTMath75thPercentileScore, 
LEFT(METADATA$FileName,4)::INTEGER AS AcademicYear, 
metadata$filename::VARCHAR AS IngestedFileName, 
metadata$file_row_number::INTEGER AS RowNumber 
FROM 
  @IPEDS_ADM
WHERE CAST(LEFT(METADATA$FileName,4) AS VARCHAR) = ` + YEAR.toString()+`;`

    try {
        snowflake.execute (
          {sqlText: sql_command}
          );
        }
    catch (err) {
        return "Failed: " + err;  // Return a success/error indicator.
        }
    return "Success.";  // Return a success/error indicator.
$$
;
