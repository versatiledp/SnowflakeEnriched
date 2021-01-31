DROP PROCEDURE IF EXISTS pr_CodeMapping_Load();
 
CREATE OR REPLACE PROCEDURE pr_CodeMapping_Load()
RETURNS STRING
LANGUAGE javascript
AS
$$
	var sql_GetTables = 
	`SELECT DISTINCT TableName AS DestinationTable
      FROM CodeDestinationTable
      ORDER BY DestinationTable;`
 
	CmdTables = {sqlText: sql_GetTables};
	StmtTables = snowflake.createStatement(CmdTables);
	rsTables = StmtTables.execute();
	//var strCommands = '';
	var strTablePrefix = `od_`
	while (rsTables.next())  {
	var strStgTableName     	= " " 
			+ strTablePrefix 
			+ rsTables.getColumnValue("DESTINATIONTABLE")
	var sqlMergeSQL   	=
	`MERGE INTO `
		+ rsTables.getColumnValue("DESTINATIONTABLE") + ` t
	   USING ` + strStgTableName + ` s ON t.Code = s.Code
		WHEN MATCHED AND (t.Description <> s.Description) THEN
			UPDATE SET Description  = s.Description
		WHEN NOT MATCHED THEN
			INSERT (Code,Description)
			VALUES (s.Code,s.Description)
			;`
		//strCommands = strCommands + sqlMergeSQL +'-->'
		try
		{ 
			snowflake.execute(
			   {sqlText: sqlMergeSQL}
			);
		}
		catch(err)
		{
			return "Failed :" + err;
		}
	}
	return "success" //strCommands
$$;
