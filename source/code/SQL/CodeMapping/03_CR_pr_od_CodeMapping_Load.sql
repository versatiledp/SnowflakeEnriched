CREATE OR REPLACE PROCEDURE pr_od_CodeMapping_Load()
RETURNS STRING
LANGUAGE javascript
AS
$$
var sql_GetTables = `SELECT DISTINCT UPPER(s.$1) AS CodeName ,
			UPPER(TableName) AS DestinationTable	
		FROM @IPEDS_CM s
		INNER JOIN CodeDestinationTable 
			ON s.$1 =  CodeDestinationTable.Code	
		ORDER BY CodeName;`

CmdTables = {sqlText: sql_GetTables};
StmtTables = snowflake.createStatement(CmdTables);
rsTables = StmtTables.execute();
var strSQLCommands = '';
var strTablePrefix = ` od_`
while (rsTables.next())  {
var strStgTableName         = strTablePrefix 
	+ rsTables.getColumnValue("DESTINATIONTABLE")
var sqlStgTableTruncate     = `TRUNCATE TABLE IF EXISTS ` 
	+ strStgTableName +`;`
var sqlStgTableCreate       = `CREATE TABLE IF NOT EXISTS` 
	+ strStgTableName+` (Code STRING, Description STRING);`
var sqlTargetTableCreate    = `CREATE TABLE IF NOT EXISTS` 
	+' '+ rsTables.getColumnValue("DESTINATIONTABLE") 
	+` (Code STRING, Description STRING);`
var sqlStgTableInsert       = `INSERT INTO 
	`+ strStgTableName + `(Code,Description)
	SELECT 
	 LEFT(CodeValuePair,POSITION('=',CodeValuePair,1)-1) Code,
	 RIGHT(CodeValuePair,
		LEN(CodeValuePair) - POSITION('=',CodeValuePair,1))
			TableCodeValue
	FROM(
		SELECT 
			$1 AS CodeName, 
			$2 AS TableData, 
			REPLACE($2,'''','') AS CodeValuePair
		 FROM @IPEDS_CM t
		WHERE UPPER($1) = '
			`+ rsTables.getColumnValue("CODENAME") + `' ) A;`
var arrSqlCmd =[4];
arrSqlCmd[0] = sqlStgTableTruncate
arrSqlCmd[1] = sqlStgTableCreate
arrSqlCmd[2] = sqlTargetTableCreate
arrSqlCmd[3] = sqlStgTableInsert
var sql_ExecCommand ='';
for (var j=0;j<arrSqlCmd.length; j++)
{
	sql_ExecCommand = arrSqlCmd[j] 
	try
	{  
		snowflake.execute(
			{sqlText: sql_ExecCommand}
		); 
	}
	catch(err)
	{
		return "Failed :" + err;
	} 
}
}
return "Success";
$$;