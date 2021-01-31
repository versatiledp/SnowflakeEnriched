CREATE TABLE CodeDestinationTable
( 
            	Code STRING,
            	TableName STRING
);


INSERT INTO CodeDestinationTable (Code,TableName)
SELECT 'ACT','InstitutionStatus'  UNION ALL
SELECT 'c15basic','CarnegieClassification2015'  UNION ALL
SELECT 'c18basic','CarnegieClassification2018'  UNION ALL
SELECT 'c18ipug','CarnegieClassification2000'  UNION ALL
SELECT 'carnegie','CarnegieClassification'  UNION ALL -- Same name as above
SELECT 'cbsa','CoreBasedStatisticalArea'  UNION ALL
SELECT 'cbsatype','CBSATypeMetropolitan'  UNION ALL
SELECT 'ccbasic','CarnegieClassification2005'  UNION ALL
SELECT 'cngdstcd','StateCongressionalDistricID'  UNION ALL
SELECT 'control','InstitutionControl'  UNION ALL
SELECT 'countycd','CountryCode'  UNION ALL
SELECT 'csa','CombinedStatisticalArea'  UNION ALL
SELECT 'cyactive','InstitutionActive'  UNION ALL
SELECT 'deathyr','InstitutionDeletedYear'  UNION ALL
SELECT 'deggrant','DegreeGrantingStatus'  UNION ALL
SELECT 'dfrcgid','NCESDataFeedbackReport'  UNION ALL
SELECT 'dfrcuscg','InstitutionDataFeedbackReport'  UNION ALL
SELECT 'f1syscod','IdentificationNumberMultiCampusOrganization' UNION ALL
SELECT 'f1systyp','MultiinstitutionMulticampusOrganization' UNION ALL
SELECT 'fips','FIPSStateCode'  UNION ALL
SELECT 'groffer','GraduateOffering'  UNION ALL
SELECT 'hbcu','HistoricallyBlackCollege'  UNION ALL
SELECT 'HDEGOFR1','HighestDegreeOffered'  UNION ALL
SELECT 'hloffer','HighestLevelOffering'  UNION ALL
SELECT 'hospital','HospitalInstitution'  UNION ALL
SELECT 'iclevel','InstitutionLevel'  UNION ALL
SELECT 'instcat','InstitutionalCategory'  UNION ALL
SELECT 'instsize','InstitutionSizeCategory'  UNION ALL
SELECT 'landgrnt','LandGrantInstitution'  UNION ALL
SELECT 'locale','UrbanizationDegree'  UNION ALL
SELECT 'medical','MedicalDegreeGranted'  UNION ALL
SELECT 'necta','NewEnglandArea'  UNION ALL
SELECT 'obereg','EconomicBureauRegion'  UNION ALL
SELECT 'opeflag','TitleIVEligibilityCode'  UNION ALL
SELECT 'openpubl','InstitutionOpenGeneralPublic'  UNION ALL
SELECT 'postsec','PrimaryPostsecondaryIndicator'  UNION ALL
SELECT 'pseflag','PostsecondaryInstitution'  UNION ALL
SELECT 'pset4flg','PostsecondaryTitleIVInstitutionIndicator' UNION ALL
SELECT 'rptmth','ReportingMethod'  UNION ALL
SELECT 'sector','InstitutionSector'  UNION ALL
SELECT 'stabbr','StateAbbreviation'  UNION ALL
SELECT 'tribal','TribalCollege'  UNION ALL
SELECT 'ugoffer','UndergraduateOffering' ;
