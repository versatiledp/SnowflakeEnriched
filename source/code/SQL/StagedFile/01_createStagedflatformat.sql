-- Number of header lines at the start of the file. 
-- The COPY command skips header lines when loading data
-- All these file formats can be used to create different stage areas
CREATE OR REPLACE  FILE FORMAT 
		ff_IPEDS_CSVSkipHeaderTabDelimited
			TYPE =   CSV  
			FIELD_DELIMITER = '\t'  COMPRESSION = AUTO
			SKIP_HEADER = 1;
CREATE OR REPLACE  FILE FORMAT 
		ff_IPEDS_CSVSkipHeaderCommaDelimited 
			TYPE =   CSV  
			FIELD_DELIMITER = ','  COMPRESSION = AUTO
			SKIP_HEADER = 1;
-- The COPY command does not skip any lines.  
CREATE OR REPLACE  FILE FORMAT 
		ff_IPEDS_CSVHeaderTabDelimited
			TYPE =   CSV  
			FIELD_DELIMITER = '\t'  COMPRESSION = AUTO
			SKIP_HEADER = 1 ; 
CREATE OR REPLACE  FILE FORMAT 
		ff_IPEDS_CSVHeaderCommaDelimited  
			TYPE =   CSV  
			FIELD_DELIMITER = ','  COMPRESSION = AUTO
			SKIP_HEADER = 0 encoding = 'iso-8859-1' 
			FIELD_OPTIONALLY_ENCLOSED_BY='"'; 
-- create satge area to load csv files for the project
CREATE OR REPLACE STAGE IPEDS_HD FILE_FORMAT 
			= ff_IPEDS_CSVHeaderCommaDelimited;
CREATE OR REPLACE STAGE IPEDS_CM FILE_FORMAT 
			= ff_IPEDS_CSVSkipHeaderTabDelimited; 