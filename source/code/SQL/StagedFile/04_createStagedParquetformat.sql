-- Create Parquet file format
CREATE OR REPLACE  FILE FORMAT ff_IPEDS_Parquet
			TYPE =PARQUET TRIM_SPACE = TRUE;
-- Create stage area to load Parquet file 
CREATE OR REPLACE stage IPEDS_ADM FILE_FORMAT = ff_IPEDS_Parquet;