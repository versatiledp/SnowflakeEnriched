CREATE OR REPLACE PROCEDURE 
	pr_InstitutionalChargeByAcademicBranch_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
EXECUTE AS OWNER
AS
$$
var sql_DelCommand = 
`DELETE FROM InstitutionalChargeByAcademicBranch 
	WHERE AcademicYear = `+ YEAR.toString() +`;`
var sql_Command =
`INSERT INTO
   InstitutionalChargeByAcademicBranch ( 
	  AcademicInstitutionUniqueDWSID,  
	  InstitutionIdentifier,
	  AcademicYear,
	  BranchName,
	  ChargeType,
	  Amount
    ) 
   SELECT
        IFNULL(D.AcademicInstitutionUniqueDWSID,-1),  
		S.InstitutionIdentifier,
		S.AcademicYear,
		S.BranchName,
		S.ChargeType,
		S.Amount
   FROM
      V_od_InstitutionalChargeByAcademicBranch S
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
