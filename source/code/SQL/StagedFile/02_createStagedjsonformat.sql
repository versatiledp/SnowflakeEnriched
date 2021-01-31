-- Create file format to load json file 
CREATE OR REPLACE FILE FORMAT ff_IPEDS_Json
		TYPE =JSON TRIM_SPACE = TRUE; 
-- Create stage area to load json  
CREATE OR REPLACE stage IPEDS_EFFY FILE_FORMAT = ff_IPEDS_Json;