CREATE OR REPLACE PROCEDURE
pr_od_Enrollment_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
AS
//Delete and Insert data to fact
$$
var sql_Command = `
INSERT INTO od_Enrollment (
LevelOfStudent, 
TwoOrMoreRacesMen, 
TwoOrMoreRacesTotal, 
TwoOrMoreRacesWomen, 
AmericanIndianOrAlaskaNativeMen, 
AmericanIndianOrAlaskaNativeTotal, 
AmericanIndianOrAlaskaNativeWomen, 
AsianMen, 
AsianTotal, 
AsianWomen, 
AfricanAmericanMen, 
AfricanAmericanTotal, 
AfricanAmericanWomen, 
HispanicOrLatinoMen, 
HispanicOrLatinoTotal, 
HispanicOrLatinoWomen, 
HawaiianPacificIslanderMen, 
HawaiianPacificIslanderTotal, 
HawaiianPacificIslanderWomen, 
NonresidentAlienMen, 
NonresidentAlienTotal, 
NonresidentAlienWomen, 
TotalMen, 
Total, 
TotalWomen, 
RaceEthnicityUnknownMen, 
RaceEthnicityUnknownTotal,
RaceEthnicityUnknownWomen, 
WhiteMen, 
WhiteTotal, 
WhiteWomen, 
OriginalLevelOfStudyOnSurveyForm, 
InstitutionIdentifier, 
ImputationVarTwoOrMoreRacesMen, 
ImputationVarTwoOrMoreRacesTotal, 
ImputationVarTwoOrMoreRacesWomen, 
ImputationVarAmericanIndianOrAlaskaNativeMen, 
ImputationVarAmericanIndianOrAlaskaNativeTotal, 
ImputationVarAmericanIndianOrAlaskaNativeWomen, 
ImputationVarAsianMen, 
ImputationVarAsianTotal, 
ImputationVarAsianWomen, 
ImputationVarAfricanAmericanMen, 
ImputationVarAfricanAmericanTotal, 
ImputationVarAfricanAmericanWomen, 
ImputationVarHispanicOrLatinoMen, 
ImputationVarHispanicOrLatinoTotal, 
ImputationVarHispanicOrLatinoWomen, 
ImputationVarHawaiianPacificIslanderMen, 
ImputationVarHawaiianPacificIslanderTotal, 
ImputationVarHawaiianPacificIslanderWomen, 
ImputationVarWhiteMen, 
ImputationVarWhiteTotal, 
ImputationVarWhiteWomen, 
ImputationVarNonresidentAlienMen, 
ImputationVarNonresidentAlienTotal, 
ImputationVarNonresidentAlienWomen, 
ImputationVarTotalMen, 
ImputationVarTotal, 
ImputationVarTotalWomen, 
ImputationVarRaceEthnicityUnknownMen, 
ImputationVarRaceEthnicityUnknownTotal, 
ImputationVarRaceEthnicityUnknownWomen, 
AcademicYear,
IngestedFileName, 
RowNumber
)

SELECT 
 S.$1:EFFYLEV::INTEGER  AS LevelOfStudent
,S.$1:EFY2MORM::INTEGER AS TwoOrMoreRacesMen
,S.$1:EFY2MORT::INTEGER AS TwoOrMoreRacesTotal    
,S.$1:EFY2MORW::INTEGER AS TwoOrMoreRacesWomen
,S.$1:EFYAIANM::INTEGER AS AmericanIndianOrAlaskaNativeMen
,S.$1:EFYAIANT::INTEGER AS AmericanIndianOrAlaskaNativeTotal 
,S.$1:EFYAIANW::INTEGER AS AmericanIndianOrAlaskaNativeWomen 
,S.$1:EFYASIAM::INTEGER AS AsianMen      
,S.$1:EFYASIAT::INTEGER AS AsianTotal
,S.$1:EFYASIAW::INTEGER AS AsianWomen
,S.$1:EFYBKAAM::INTEGER AS AfricanAmericanMen
,S.$1:EFYBKAAT::INTEGER AS AfricanAmericanTotal
,S.$1:EFYBKAAW::INTEGER AS AfricanAmericanWomen
,S.$1:EFYHISPM::INTEGER AS HispanicOrLatinoMen
,S.$1:EFYHISPT::INTEGER AS HispanicOrLatinoTotal
,S.$1:EFYHISPW::INTEGER AS HispanicOrLatinoWomen
,S.$1:EFYNHPIM::INTEGER AS HawaiianPacificIslanderMen
,S.$1:EFYNHPIT::INTEGER AS HawaiianPacificIslanderTotal
,S.$1:EFYNHPIW::INTEGER AS HawaiianPacificIslanderWomen
,S.$1:EFYNRALM::INTEGER AS NonresidentAlienMen
,S.$1:EFYNRALT::INTEGER AS NonresidentAlienTotal
,S.$1:EFYNRALW::INTEGER AS NonresidentAlienWomen
,S.$1:EFYTOTLM::INTEGER AS TotalMen
,S.$1:EFYTOTLT::INTEGER AS Total
,S.$1:EFYTOTLW::INTEGER AS TotalWomen
,S.$1:EFYUNKNM::INTEGER AS RaceEthnicityUnknownMen
,S.$1:EFYUNKNT::INTEGER AS RaceEthnicityUnknownTotal
,S.$1:EFYUNKNW::INTEGER AS RaceEthnicityUnknownWomen
,S.$1:EFYWHITM::INTEGER AS WhiteMen
,S.$1:EFYWHITT::INTEGER AS WhiteTotal
,S.$1:EFYWHITW::INTEGER AS WhiteWomen
,S.$1:LSTUDY::INTEGER AS OriginalLevelOfStudyOnSurveyForm
,S.$1:UNITID::INTEGER AS InstitutionIdentifier
,S.$1:XEFY2MOM::STRING AS ImputationVarTwoOrMoreRacesMen
,S.$1:XEFY2MOT::STRING AS ImputationVarTwoOrMoreRacesTotal
,S.$1:XEFY2MOW::STRING AS 
		ImputationVarTwoOrMoreRacesWomen
,S.$1:XEFYAIAM::STRING AS 
		ImputationVarAmericanIndianOrAlaskaNativeMen
,S.$1:XEFYAIAT::STRING AS 
		ImputationVarAmericanIndianOrAlaskaNativeTotal
,S.$1:XEFYAIAW::STRING AS 
		ImputationVarAmericanIndianOrAlaskaNativeWomen
,S.$1:XEFYASIM::STRING AS ImputationVarAsianMen
,S.$1:XEFYASIT::STRING AS ImputationVarAsianTotal
,S.$1:XEFYASIW::STRING AS ImputationVarAsianWomen
,S.$1:XEFYBKAM::STRING AS ImputationVarAfricanAmericanMen
,S.$1:XEFYBKAT::STRING AS ImputationVarAfricanAmericanTotal
,S.$1:XEFYBKAW::STRING AS ImputationVarAfricanAmericanWomen
,S.$1:XEFYHISM::STRING AS ImputationVarHispanicOrLatinoMen
,S.$1:XEFYHIST::STRING AS ImputationVarHispanicOrLatinoTotal
,S.$1:XEFYHISW::STRING AS ImputationVarHispanicOrLatinoWomen
,S.$1:XEFYNHPM::STRING AS ImputationVarHawaiianPacificIslanderMen
,S.$1:XEFYNHPT::STRING AS ImputationVarHawaiianPacificIslanderTotal
,S.$1:XEFYNHPW::STRING AS ImputationVarHawaiianPacificIslanderWomen
,S.$1:XEFYWHIM::STRING AS ImputationVarWhiteMen
,S.$1:XEFYWHIT::STRING AS ImputationVarWhiteTotal
,S.$1:XEFYWHIW::STRING AS ImputationVarWhiteWomen
,S.$1:XEYNRALM::STRING AS ImputationVarNonresidentAlienMen
,S.$1:XEYNRALT::STRING AS ImputationVarNonresidentAlienTotal
,S.$1:XEYNRALW::STRING AS ImputationVarNonresidentAlienWomen
,S.$1:XEYTOTLM::STRING AS ImputationVarTotalMen
,S.$1:XEYTOTLT::STRING AS ImputationVarTotal
,S.$1:XEYTOTLW::STRING AS ImputationVarTotalWomen
,S.$1:XEYUNKNM::STRING AS 
		ImputationVarRaceEthnicityUnknownMen
,S.$1:XEYUNKNT::STRING AS 
		ImputationVarRaceEthnicityUnknownTotal
,S.$1:XEYUNKNW::STRING AS 
		ImputationVarRaceEthnicityUnknownWomen 
,RIGHT(REPLACE(S.metadata$filename,'_rv.json.gz',''),4)::INTEGER 
		AS AcademicYear
,S.metadata$filename::VARCHAR AS IngestedFileName
,S.metadata$file_row_number::INTEGER AS RowNumber 
FROM @IPEDS_EFFY S 
WHERE RIGHT(REPLACE(S.metadata$filename,'_rv.json.gz',''),4) 
= `+ YEAR.toString() 

try
{  
snowflake.execute(
{sqlText: sql_Command}
);
}
catch(err)
{
return "Failed :" + err;
}
return "success"
$$;
