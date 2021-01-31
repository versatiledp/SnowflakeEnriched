CREATE OR REPLACE TABLE InstitutionalChargeByCategory (
  AcademicInstitutionUniqueDWSID INTEGER NOT NULL,  
  InstitutionIdentifier INTEGER,
  AcademicYear INTEGER NOT NULL,
  CategoryType varchar(100) NOT NULL,
  PublishedYear INTEGER NOT NULL,
  Amount  INTEGER );
