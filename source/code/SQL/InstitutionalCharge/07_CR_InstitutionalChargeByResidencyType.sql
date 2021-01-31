CREATE OR REPLACE TABLE InstitutionalChargeByResidencyType (
  AcademicInstitutionUniqueDWSID INTEGER NOT NULL,  
  InstitutionIdentifier INTEGER,
  AcademicYear INTEGER NOT NULL,
  ResidencyType varchar(100) NOT NULL,
  PublishedYear INTEGER NOT NULL,
  Amount  INTEGER );
