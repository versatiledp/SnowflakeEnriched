-- Create file format to load ORC file 
CREATE OR REPLACE FILE FORMAT ff_IPEDS_ORC
			TYPE =ORC TRIM_SPACE = TRUE;
-- Create stage area to load ORC file 
CREATE OR REPLACE stage IPEDS_IC FILE_FORMAT = ff_IPEDS_ORC;