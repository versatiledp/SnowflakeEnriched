CREATE OR REPLACE PROCEDURE 
	pr_AcademicInstitution_Load(YEAR FLOAT)
  RETURNS STRING
  LANGUAGE javascript
  EXECUTE AS OWNER
  AS
  $$
var sql_command = 
`
MERGE INTO AcademicInstitution T USING (
SELECT  * FROM  od_AcademicInstitution
WHERE  ACADEMICYEAR = ` + YEAR.toString() +`
) S ON T.InstitutionIdentifier = S.InstitutionIdentifier
WHEN MATCHED
AND (
  IFNULL(T.InstitutionName, '') <> IFNULL(S.InstitutionName, '')
  OR IFNULL(T.InstitutionNameAlias, '') 
	<> IFNULL(S.InstitutionNameAlias, '')
  OR IFNULL(T.StreetAddress, '') <> IFNULL(S.StreetAddress, '')
  OR IFNULL(T.City, '') <> IFNULL(S.City, '')
  OR IFNULL(T.State, '') <> IFNULL(S.State, '')
  OR IFNULL(T.ZipCode, '') <> IFNULL(S.ZipCode, '')
  OR IFNULL(T.StateCode, 0) <> IFNULL(S.StateCode, 0)
  OR IFNULL(T.EconomicAnalysisRegions, 0) 
	<> IFNULL(S.EconomicAnalysisRegions, 0)
  OR IFNULL(T.ChiefAdministrator, '') 
	<> IFNULL(S.ChiefAdministrator, '')
  OR IFNULL(T.ChiefAdministratorTitle, '') 
	<> IFNULL(S.ChiefAdministratorTitle, '')
  OR IFNULL(T.TelephoneNumber, '') <> IFNULL(S.TelephoneNumber, '')
  OR IFNULL(T.EmployerIdentificationNumber, '') 
	<> IFNULL(S.EmployerIdentificationNumber, '')
  OR IFNULL(T.DunBradstreetNumbers, '') 
	<> IFNULL(S.DunBradstreetNumbers, '')
  OR IFNULL(T.PostsecondaryEducationIDNumber, '') 
	<> IFNULL(S.PostsecondaryEducationIDNumber, '')
  OR IFNULL(T.TitleIVEligibilityIndicatorCode, 0) 
	<> IFNULL(S.TitleIVEligibilityIndicatorCode, 0)	
  OR IFNULL(T.SectorOfInstitution, 0) 
	<> IFNULL(S.SectorOfInstitution, 0)
  OR IFNULL(T.LevelOfInstitution, 0) 
	<> IFNULL(S.LevelOfInstitution, 0)
  OR IFNULL(T.ControlOfInstitution, 0) 
	<> IFNULL(S.ControlOfInstitution, 0)
  OR IFNULL(T.HighestLevelOfOffering, 0) 
	<> IFNULL(S.HighestLevelOfOffering, 0)
  OR IFNULL(T.UndergraduateOffering, 0) 
	<> IFNULL(S.UndergraduateOffering, 0)
  OR IFNULL(T.GraduateOffering, 0) 
	<> IFNULL(S.GraduateOffering, 0)
  OR IFNULL(T.HighestDegreeOffered, 0) 
	<> IFNULL(S.HighestDegreeOffered, 0)
  OR IFNULL(T.DegreeGrantingStatus, 0) 
	<> IFNULL(S.DegreeGrantingStatus, 0)
  OR IFNULL(T.HistoricallyBlackCollegeOrUniversity, 0) 
	<> IFNULL(S.HistoricallyBlackCollegeOrUniversity, 0)
  OR IFNULL(T.InstitutionHasHospital, 0) 
	<> IFNULL(S.InstitutionHasHospital, 0)
  OR IFNULL(T.InstitutionGrantsMedicalDegree, 0) 
	<> IFNULL(S.InstitutionGrantsMedicalDegree, 0)
  OR IFNULL(T.TribalCollege, 0) <> IFNULL(S.TribalCollege, 0)
  OR IFNULL(T.DegreeOfUrbanization, 0) 
	<> IFNULL(S.DegreeOfUrbanization, 0)
  OR IFNULL(T.InstitutionOpenToGeneralPublic, 0) 
	<> IFNULL(S.InstitutionOpenToGeneralPublic, 0)
  OR IFNULL(T.StatusOfInstitution, '') 
	<> IFNULL(S.StatusOfInstitution, '')
  OR IFNULL(T.UnitidForMergedSchools, 0) 
	<> IFNULL(S.UnitidForMergedSchools, 0)
  OR IFNULL(T.YearInstitutionWasDeletedFromIPEDS, 0) 
	<> IFNULL(S.YearInstitutionWasDeletedFromIPEDS, 0)
  OR IFNULL(T.DateInstitutionClosed, '') 
	<> IFNULL(S.DateInstitutionClosed, '')
  OR IFNULL(T.InstitutionIsActive, 0) 
	<> IFNULL(S.InstitutionIsActive, 0)
  OR IFNULL(T.PrimarilyPostsecondaryIndicator, 0) 
	<> IFNULL(S.PrimarilyPostsecondaryIndicator, 0)
  OR IFNULL(T.PostsecondaryInstitutionIndicator, 0) 
	<> IFNULL(S.PostsecondaryInstitutionIndicator, 0)
  OR IFNULL(T.PostsecondaryAndTitleIvInstitutionIndicator, 0) 
	<> IFNULL(S.PostsecondaryAndTitleIvInstitutionIndicator, 0)
  OR IFNULL(T.ReportingMethodForStudentCharges, 0) 
	<> IFNULL(S.ReportingMethodForStudentCharges, 0)
  OR IFNULL(T.InstitutionalCategory, 0) 
	<> IFNULL(S.InstitutionalCategory, 0)
  OR IFNULL(T.LandGrantInstitution, 0) 
	<> IFNULL(S.LandGrantInstitution, 0)
  OR IFNULL(T.InstitutionSizeCategory, 0) 
	<> IFNULL(S.InstitutionSizeCategory, 0)
  OR IFNULL(T.MultiCampusOrganization, 0) 
	<> IFNULL(S.MultiCampusOrganization, 0)
  OR IFNULL(T.NameOfMultiCampusOrganization, '') 
	<> IFNULL(S.NameOfMultiCampusOrganization, '')
  OR IFNULL(T.IdentificationNumberOfMultiCampusOrganization, '') 
	<> IFNULL(S.IdentificationNumberOfMultiCampusOrganization,'')
  OR IFNULL(T.CoreBasedStatisticalArea, 0) 
	<> IFNULL(S.CoreBasedStatisticalArea, 0)
  OR IFNULL(T.CBSATypeMetropolitanMicropolitan, 0) 
	<> IFNULL(S.CBSATypeMetropolitanMicropolitan, 0)
  OR IFNULL(T.CombinedStatisticalArea, 0) 
	<> IFNULL(S.CombinedStatisticalArea, 0)
  OR IFNULL(T.NewEnglandCityAndTownArea, 0) 
	<> IFNULL(S.NewEnglandCityAndTownArea, 0)
  OR IFNULL(T.FIPSCountyCode, 0) <> IFNULL(S.FIPSCountyCode, 0)
  OR IFNULL(T.CountyName, '') <> IFNULL(S.CountyName, '')
  OR IFNULL(T.StateAnd114thCongressionalDistrictID, 0) 
	<> IFNULL(S.StateAnd114thCongressionalDistrictID, 0)
  OR IFNULL(T.LongitudeLocation, 0.0) 
	<> IFNULL(S.LongitudeLocation, 0.0)
  OR IFNULL(T.LatitudeLocation, 0.0) 
	<> IFNULL(S.LatitudeLocation, 0.0)
  OR IFNULL(T.NCESGroupCategory, 0) 
	<> IFNULL(S.NCESGroupCategory, 0)
  OR IFNULL(T.DataFeedbackReport, 0) 
	<> IFNULL(S.DataFeedbackReport, 0)
  OR CarnegieClassification  <> OBJECT_CONSTRUCT (
	'AcademicInstitutionIdentifier'
		,S.InstitutionIdentifier,
	'CarnegieClassification2000' 
		,S.CarnegieClassification2000,
	'CarnegieClassification20052010Basic' 
		,S.CarnegieClassification20052010Basic,
	'CarnegieClassification2015Basic' 
		,S.CarnegieClassification2015Basic,
	'CarnegieClassification2015UndergraduateProgram' 
		,S.CarnegieClassification2015UndergraduateProgram,
	'CarnegieClassification2015GraduateProgram' 
		,S.CarnegieClassification2015GraduateProgram,
	'CarnegieClassification2015UndergraduateProfile' 
		,S.CarnegieClassification2015UndergraduateProfile,
	'CarnegieClassification2015EnrollmentProfile' 
		,S.CarnegieClassification2015EnrollmentProfile,
	'CarnegieClassification2015SizeSetting' 
		,S.CarnegieClassification2015SizeSetting
			   )  
  OR WebAddress <> OBJECT_CONSTRUCT (		
	'AcademicInstitutionIdentifier'
		,S.InstitutionIdentifier,	   
	'InstitutionsWebAddress'
		,S.InstitutionsWebAddress,
	'AdmissionsOfficeWebAddress'
		,S.AdmissionsOfficeWebAddress,
	'FinancialAidOfficeWebAddress'
		,S.FinancialAidOfficeWebAddress,
	'OnlineApplicationWebAddress'
		,S.OnlineApplicationWebAddress,
	'NetPriceCalculatorWebAddress'
		,S.NetPriceCalculatorWebAddress,
	'VeteransMilitaryServiceTuitionPoliciesWebAddress'
		,S.VeteransMilitaryServiceTuitionPoliciesWebAddress,
	'StudentRightAthleteGraduationRateWebAddress'
		,S.StudentRightAthleteGraduationRateWebAddress,
	'DisabilityServicesWebAddress'
		,S.DisabilityServicesWebAddress
		   )

) THEN
UPDATE
SET
  InstitutionIdentifier = S.InstitutionIdentifier,
  InstitutionName = S.InstitutionName,
  InstitutionNameAlias = S.InstitutionNameAlias,
  StreetAddress = S.StreetAddress,
  City = S.City,
  State = S.State,
  ZipCode = S.ZipCode,
  StateCode = S.StateCode,
  EconomicAnalysisRegions = S.EconomicAnalysisRegions,
  ChiefAdministrator = S.ChiefAdministrator,
  ChiefAdministratorTitle = S.ChiefAdministratorTitle,
  TelephoneNumber = S.TelephoneNumber,
  EmployerIdentificationNumber = 
		S.EmployerIdentificationNumber,
  DunBradstreetNumbers = S.DunBradstreetNumbers,
  PostsecondaryEducationIDNumber = 
		S.PostsecondaryEducationIDNumber,
  TitleIVEligibilityIndicatorCode = 
		S.TitleIVEligibilityIndicatorCode,
  SectorOfInstitution = S.SectorOfInstitution,
  LevelOfInstitution = S.LevelOfInstitution,
  ControlOfInstitution = S.ControlOfInstitution,
  HighestLevelOfOffering = S.HighestLevelOfOffering,
  UndergraduateOffering = S.UndergraduateOffering,
  GraduateOffering = S.GraduateOffering,
  HighestDegreeOffered = S.HighestDegreeOffered,
  DegreeGrantingStatus = S.DegreeGrantingStatus,
  HistoricallyBlackCollegeOrUniversity 
		= S.HistoricallyBlackCollegeOrUniversity,
  InstitutionHasHospital = 
		S.InstitutionHasHospital,
  InstitutionGrantsMedicalDegree = 
		S.InstitutionGrantsMedicalDegree,
  TribalCollege = S.TribalCollege,
  DegreeOfUrbanization = S.DegreeOfUrbanization,
  InstitutionOpenToGeneralPublic = 
		S.InstitutionOpenToGeneralPublic,
  StatusOfInstitution = S.StatusOfInstitution,
  UnitidForMergedSchools = S.UnitidForMergedSchools,
  YearInstitutionWasDeletedFromIPEDS 
		= S.YearInstitutionWasDeletedFromIPEDS,
  DateInstitutionClosed = S.DateInstitutionClosed,
  InstitutionIsActive = S.InstitutionIsActive,
  PrimarilyPostsecondaryIndicator = 
		S.PrimarilyPostsecondaryIndicator,
  PostsecondaryInstitutionIndicator = 
		S.PostsecondaryInstitutionIndicator,
  PostsecondaryAndTitleIvInstitutionIndicator 
		= S.PostsecondaryAndTitleIvInstitutionIndicator,
  ReportingMethodForStudentCharges 
		= S.ReportingMethodForStudentCharges,
  InstitutionalCategory = S.InstitutionalCategory,
  LandGrantInstitution = S.LandGrantInstitution,
  InstitutionSizeCategory = S.InstitutionSizeCategory,
  MultiCampusOrganization = S.MultiCampusOrganization,
  NameOfMultiCampusOrganization = 
		S.NameOfMultiCampusOrganization,
  IdentificationNumberOfMultiCampusOrganization 
		= S.IdentificationNumberOfMultiCampusOrganization,
  CoreBasedStatisticalArea = 
		S.CoreBasedStatisticalArea,
  CBSATypeMetropolitanMicropolitan = 
		S.CBSATypeMetropolitanMicropolitan,
  CombinedStatisticalArea = S.CombinedStatisticalArea,
  NewEnglandCityAndTownArea = S.NewEnglandCityAndTownArea,
  FIPSCountyCode = S.FIPSCountyCode,
  CountyName = S.CountyName,
  StateAnd114thCongressionalDistrictID 
		= S.StateAnd114thCongressionalDistrictID,
  LongitudeLocation = S.LongitudeLocation,
  LatitudeLocation = S.LatitudeLocation,
  NCESGroupCategory = S.NCESGroupCategory,
  DataFeedbackReport = S.DataFeedbackReport,
  CarnegieClassification =OBJECT_CONSTRUCT (
	'AcademicInstitutionIdentifier'
		,S.InstitutionIdentifier,
	'CarnegieClassification2000' 
		,S.CarnegieClassification2000,
	'CarnegieClassification20052010Basic' 
		,S.CarnegieClassification20052010Basic,
	'CarnegieClassification2015Basic' 
		,S.CarnegieClassification2015Basic,
	'CarnegieClassification2015UndergraduateProgram' 
		,S.CarnegieClassification2015UndergraduateProgram,
	'CarnegieClassification2015GraduateProgram' 
		,S.CarnegieClassification2015GraduateProgram,
	'CarnegieClassification2015UndergraduateProfile' 
		,S.CarnegieClassification2015UndergraduateProfile,
	'CarnegieClassification2015EnrollmentProfile' 
		,S.CarnegieClassification2015EnrollmentProfile,
	'CarnegieClassification2015SizeSetting' 
		,S.CarnegieClassification2015SizeSetting
	   ),
  WebAddress=OBJECT_CONSTRUCT (		
	'AcademicInstitutionIdentifier'
		,S.InstitutionIdentifier,	   
	'InstitutionsWebAddress'
		,S.InstitutionsWebAddress,
	'AdmissionsOfficeWebAddress'
		,S.AdmissionsOfficeWebAddress,
	'FinancialAidOfficeWebAddress'
		,S.FinancialAidOfficeWebAddress,
	'OnlineApplicationWebAddress'
		,S.OnlineApplicationWebAddress,
	'NetPriceCalculatorWebAddress'
		,S.NetPriceCalculatorWebAddress,
	'VeteransMilitaryServiceTuitionPoliciesWebAddress'
		,S.VeteransMilitaryServiceTuitionPoliciesWebAddress,
	'StudentRightAthleteGraduationRateWebAddress'
		,S.StudentRightAthleteGraduationRateWebAddress,
	'DisabilityServicesWebAddress'
		,S.DisabilityServicesWebAddress
	   ),
  AcademicYear=S.AcademicYear,
  RecordUpdateDateTime = CURRENT_TIMESTAMP
  WHEN NOT MATCHED THEN
INSERT
  (
	InstitutionIdentifier,
	InstitutionName,
	InstitutionNameAlias,
	StreetAddress,
	City,
	State,
	ZipCode,
	StateCode,
	EconomicAnalysisRegions,
	ChiefAdministrator,
	ChiefAdministratorTitle,
	TelephoneNumber,
	EmployerIdentificationNumber,
	DunBradstreetNumbers,
	PostsecondaryEducationIDNumber,
	TitleIVEligibilityIndicatorCode,
	SectorOfInstitution,
	LevelOfInstitution,
	ControlOfInstitution,
	HighestLevelOfOffering,
	UndergraduateOffering,
	GraduateOffering,
	HighestDegreeOffered,
	DegreeGrantingStatus,
	HistoricallyBlackCollegeOrUniversity,
	InstitutionHasHospital,
	InstitutionGrantsMedicalDegree,
	TribalCollege,
	DegreeOfUrbanization,
	InstitutionOpenToGeneralPublic,
	StatusOfInstitution,
	UnitidForMergedSchools,
	YearInstitutionWasDeletedFromIPEDS,
	DateInstitutionClosed,
	InstitutionIsActive,
	PrimarilyPostsecondaryIndicator,
	PostsecondaryInstitutionIndicator,
	PostsecondaryAndTitleIvInstitutionIndicator,
	ReportingMethodForStudentCharges,
	InstitutionalCategory,
	LandGrantInstitution,
	InstitutionSizeCategory,
	MultiCampusOrganization,
	NameOfMultiCampusOrganization,
	IdentificationNumberOfMultiCampusOrganization,
	CoreBasedStatisticalArea,
	CBSATypeMetropolitanMicropolitan,
	CombinedStatisticalArea,
	NewEnglandCityAndTownArea,
	FIPSCountyCode,
	CountyName,
	StateAnd114thCongressionalDistrictID,
	LongitudeLocation,
	LatitudeLocation,
	NCESGroupCategory,
	DataFeedbackReport,
	AcademicYear,
	CarnegieClassification,
	WebAddress, 
	RecordCreateDateTime)
VALUES
  (
	S.InstitutionIdentifier,
	S.InstitutionName,
	S.InstitutionNameAlias,
	S.StreetAddress,
	S.City,
	S.State,
	S.ZipCode,
	S.StateCode,
	S.EconomicAnalysisRegions,
	S.ChiefAdministrator,
	S.ChiefAdministratorTitle,
	S.TelephoneNumber,
	S.EmployerIdentificationNumber,
	S.DunBradstreetNumbers,
	S.PostsecondaryEducationIDNumber,
	S.TitleIVEligibilityIndicatorCode,
	S.SectorOfInstitution,
	S.LevelOfInstitution,
	S.ControlOfInstitution,
	S.HighestLevelOfOffering,
	S.UndergraduateOffering,
	S.GraduateOffering,
	S.HighestDegreeOffered,
	S.DegreeGrantingStatus,
	S.HistoricallyBlackCollegeOrUniversity,
	S.InstitutionHasHospital,
	S.InstitutionGrantsMedicalDegree,
	S.TribalCollege,
	S.DegreeOfUrbanization,
	S.InstitutionOpenToGeneralPublic,
	S.StatusOfInstitution,
	S.UnitidForMergedSchools,
	S.YearInstitutionWasDeletedFromIPEDS,
	S.DateInstitutionClosed,
	S.InstitutionIsActive,
	S.PrimarilyPostsecondaryIndicator,
	S.PostsecondaryInstitutionIndicator,
	S.PostsecondaryAndTitleIvInstitutionIndicator,
	S.ReportingMethodForStudentCharges,
	S.InstitutionalCategory,
	S.LandGrantInstitution,
	S.InstitutionSizeCategory,
	S.MultiCampusOrganization,
	S.NameOfMultiCampusOrganization,
	S.IdentificationNumberOfMultiCampusOrganization,
	S.CoreBasedStatisticalArea,
	S.CBSATypeMetropolitanMicropolitan,
	S.CombinedStatisticalArea,
	S.NewEnglandCityAndTownArea,
	S.FIPSCountyCode,
	S.CountyName,
	S.StateAnd114thCongressionalDistrictID,
	S.LongitudeLocation,
	S.LatitudeLocation,
	S.NCESGroupCategory,
	S.DataFeedbackReport,
	S.AcademicYear	,
	OBJECT_CONSTRUCT (
	'AcademicInstitutionIdentifier'
		,S.InstitutionIdentifier,
	'CarnegieClassification2000' 
		,S.CarnegieClassification2000,
	'CarnegieClassification20052010Basic' 
		,S.CarnegieClassification20052010Basic,
	'CarnegieClassification2015Basic' 
		,S.CarnegieClassification2015Basic,
	'CarnegieClassification2015UndergraduateProgram' 
		,S.CarnegieClassification2015UndergraduateProgram,
	'CarnegieClassification2015GraduateProgram' 
		,S.CarnegieClassification2015GraduateProgram,
	'CarnegieClassification2015UndergraduateProfile' 
		,S.CarnegieClassification2015UndergraduateProfile,
	'CarnegieClassification2015EnrollmentProfile' 
		,S.CarnegieClassification2015EnrollmentProfile,
	'CarnegieClassification2015SizeSetting' 
		,S.CarnegieClassification2015SizeSetting
	   ),
	OBJECT_CONSTRUCT (		
	'AcademicInstitutionIdentifier'
		,S.InstitutionIdentifier,	   
	'InstitutionsWebAddress'
		,S.InstitutionsWebAddress,
	'AdmissionsOfficeWebAddress'
		,S.AdmissionsOfficeWebAddress,
	'FinancialAidOfficeWebAddress'
		,S.FinancialAidOfficeWebAddress,
	'OnlineApplicationWebAddress'
		,S.OnlineApplicationWebAddress,
	'NetPriceCalculatorWebAddress'
		,S.NetPriceCalculatorWebAddress,
	'VeteransMilitaryServiceTuitionPoliciesWebAddress'
		,S.VeteransMilitaryServiceTuitionPoliciesWebAddress,
	'StudentRightAthleteGraduationRateWebAddress'
		,S.StudentRightAthleteGraduationRateWebAddress,
	'DisabilityServicesWebAddress'
		,S.DisabilityServicesWebAddress
		       ),
			CURRENT_TIMESTAMP
		  );
	`
try {
    snowflake.execute (
      {sqlText: sql_command}
      );
    return "Succeeded.";  // Return a success/error indicator.
    }
  catch (err) {
    return "Failed: " + err;  // Return a success/error indicator.
    }
  $$
  ;
