CREATE OR REPLACE TABLE Enrollment ( 
  AcademicInstitutionUniqueDWSID INTEGER, 
  InstitutionIdentifier INTEGER,  
  AcademicYear INTEGER,
  LevelOfStudent INTEGER, 
  OriginalLevelOfStudyOnSurveyForm INTEGER,
  TotalMen INTEGER,  
  TotalWomen INTEGER,   
  WhiteMen INTEGER,  
  WhiteWomen INTEGER,   
  AfricanAmericanMen INTEGER,   
  AfricanAmericanWomen INTEGER, 
  AmericanIndianOrAlaskaNativeMen INTEGER,  
  AmericanIndianOrAlaskaNativeWomen INTEGER, 
  AsianMen INTEGER,  
  AsianWomen INTEGER,  
  HispanicOrLatinoMen INTEGER,  
  HispanicOrLatinoWomen INTEGER, 
  HawaiianPacificIslanderMen INTEGER,  
  HawaiianPacificIslanderWomen INTEGER,  
  NonresidentAlienMen INTEGER,  
  NonresidentAlienWomen INTEGER,  
  TwoOrMoreRacesMen INTEGER,  
  TwoOrMoreRacesWomen INTEGER,  
  RaceEthnicityUnknownMen INTEGER,  
  RaceEthnicityUnknownWomen INTEGER,     
  ImputationVarTotalMen VARCHAR(10),  
  ImputationVarTotalWomen VARCHAR(10), 
  ImputationVarWhiteMen VARCHAR(10),  
  ImputationVarWhiteWomen VARCHAR(10), 
  ImputationVarAfricanAmericanMen VARCHAR(10),  
  ImputationVarAfricanAmericanWomen VARCHAR(10), 
  ImputationVarAmericanIndianOrAlaskaNativeMen VARCHAR(10),  
  ImputationVarAmericanIndianOrAlaskaNativeWomen VARCHAR(10), 
  ImputationVarHispanicOrLatinoMen VARCHAR(10),  
  ImputationVarHispanicOrLatinoWomen VARCHAR(10), 
  ImputationVarAsianMen VARCHAR(10),  
  ImputationVarAsianWomen VARCHAR(10),  
  ImputationVarHawaiianPacificIslanderMen VARCHAR(10),  
  ImputationVarHawaiianPacificIslanderWomen VARCHAR(10), 
  ImputationVarNonresidentAlienMen VARCHAR(10),  
  ImputationVarNonresidentAlienWomen VARCHAR(10),   
  ImputationVarTwoOrMoreRacesMen VARCHAR(10),  
  ImputationVarTwoOrMoreRacesWomen VARCHAR(10),  
  ImputationVarRaceEthnicityUnknownMen VARCHAR(10),  
  ImputationVarRaceEthnicityUnknownWomen VARCHAR(10), 
  VariablesImputedCount INTEGER,   
  VariablesReportedCount INTEGER,   
  ImputationVarPercent NUMERIC(10,4),  
  ReportedVarPercent NUMERIC(10,4) 
);
