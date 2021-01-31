CREATE OR REPLACE PROCEDURE 
	pr_InstitutionalChargeByCategory_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
EXECUTE AS OWNER
AS
$$
var sql_DelCommand = 
	`DELETE FROM InstitutionalChargeByCategory 
		WHERE AcademicYear = `+ YEAR.toString() +`;`
var sql_Command =
`INSERT INTO
   InstitutionalChargeByCategory ( 
	  AcademicInstitutionUniqueDWSID,  
	  InstitutionIdentifier,
	  AcademicYear,
	  CategoryType,
	  PublishedYear,
	  Amount
    ) 
   SELECT
        IFNULL(D.AcademicInstitutionUniqueDWSID,-1),  
		S.InstitutionIdentifier,
		S.AcademicYear,
		S.CategoryType,
		S.PublishedYear,
		S.Amount
   FROM
      V_Od_InstitutionalChargeByCategory S
    LEFT OUTER JOIN AcademicInstitution D 
		ON S.InstitutionIdentifier = D.InstitutionIdentifier
    WHERE S.AcademicYear = ` + YEAR.toString() +`;`
    
    var arrSqlCmd =[2];
    arrSqlCmd[0] = sql_DelCommand
    arrSqlCmd[1] = sql_Command
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
    return "success"
$$;
