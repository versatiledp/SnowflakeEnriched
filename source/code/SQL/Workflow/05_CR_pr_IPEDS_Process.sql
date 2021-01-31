CREATE
	OR REPLACE PROCEDURE pr_IPEDS_Process (YEAR FLOAT)
RETURNS STRING LANGUAGE javascript AS $$ 
	var sql_WF = `SELECT StageName
	,ProcedureName
	,SourceTableName
	,TargetTableName
	,ExecutionOrder
FROM IPEDS_Workflow
ORDER BY ExecutionOrder`;

CmdSql =

{sqlText: sql_WF};

StmtSql = snowflake.createStatement(CmdSql);

rsSql = StmtSql.

EXECUTE ();
 
try{

WHILE (rsSql.NEXT ()) { var strSourceTable = rsSql.
	getColumnValue("SOURCETABLENAME");
	var strTargetTable = 
		rsSql.getColumnValue("TARGETTABLENAME");

var strProcedureName = '';

var sourceCount = preCount = postCount = 'NULL';

var sqlSourceRowCount = SqlRowCount = stmtRowCount = '';

var rsPreRowCount
	,rsPostRowCount;

//Query = Query + '--Source:' 
	+ strSourceTable + ' Target: ' + strTargetTable; 
IF (strSourceTable != '') 
	{ sqlSourceRowCount = `SELECT Count(1) AS 
	Counts FROM ` + strSourceTable + 
			` WHERE AcademicYear = ` + YEAR.toString() + `;
	`;
var stmtSourceRowCount 
	= snowflake.createStatement({sqlText: 
		sqlSourceRowCount});

var rsSourceRowCount = stmtSourceRowCount.

EXECUTE ();

IF (rsSourceRowCount.NEXT ()) { sourceCount = 
	rsSourceRowCount.getColumnValue("COUNTS");
	} }

// Get Pre rowcount if the target table is provided.
IF (strTargetTable != '') { SqlRowCount = 
	`SELECT COUNT(1) AS Counts FROM ` 
	 + strTargetTable + ` WHERE AcademicYear = ` 
	 + YEAR.toString() + `;
	`;

//Query = Query + '--Target:' + SqlRowCount;
stmtRowCount = 
	snowflake.createStatement({sqlText: SqlRowCount});

rsPreRowCount = stmtRowCount.

EXECUTE ();

IF (rsPreRowCount.NEXT ()) { preCount = rsPreRowCount.
	getColumnValue("COUNTS");
	} }
	strProcedureName = `CALL ` 
		+ rsSql.getColumnValue("PROCEDURENAME").
	replace('@Year', YEAR.toString()) + `;

`;

//Query = Query + '--Proc:' + strProcedureName;
var stmtProcessData = snowflake.createStatement({sqlText: 
		strProcedureName});

stmtProcessData.

EXECUTE ();

// Get Post rowcount if the target table is provided.
IF (SqlRowCount != '') { rsPostRowCount = stmtRowCount.
	EXECUTE ();

IF (rsPostRowCount.NEXT ()) { postCount = rsPostRowCount
	.getColumnValue("COUNTS") } } 
 var sql_Audit = 
	`INSERT INTO IPEDS_Audit(StageName, ProcedureName, 
	SourceTableName, SourceRowCount, TargetTableName, PreRowCount, 
	PostRowCount) VALUES (
	'` + rsSql.getColumnValue("STAGENAME") + `'
	,'`+ strProcedureName
		  +`'
	,'`+ strSourceTable +`'
	,` + sourceCount + `
	,'`+ strTargetTable + `'
	,` + preCount + `
	,` + postCount + `
	);
`;

//Query = Query + '--Audit:' + sql_Audit;        
var stmt = snowflake.createStatement({sqlText: sql_Audit});

stmt.

EXECUTE ();

} // End While.
	} catch(err) {

RETURN "Failed:" + err.toString();

}

RETURN 'Success';$$;
