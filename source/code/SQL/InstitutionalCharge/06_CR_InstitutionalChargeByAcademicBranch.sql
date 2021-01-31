 CREATE OR REPLACE TABLE InstitutionalChargeByAcademicBranch (
  AcademicInstitutionUniqueDWSID INTEGER NOT NULL ,  
  InstitutionIdentifier INTEGER,
  AcademicYear  INTEGER NOT NULL,
  BranchName varchar(100) NOT null,
  ChargeType Varchar(100) NOT null,
  Amount  INTEGER );
