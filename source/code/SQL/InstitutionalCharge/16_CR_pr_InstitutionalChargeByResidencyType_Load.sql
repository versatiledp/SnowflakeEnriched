CREATE 
	OR REPLACE PROCEDURE 
	pr_InstitutionalChargeByResidencyType_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
EXECUTE AS OWNER
AS
$$
var sql_DelCommand = 
	`DELETE FROM InstitutionalChargeByResidencyType 
		WHERE AcademicYear = `+ YEAR.toString() +`;`
var sql_Command =
`INSERT INTO
   InstitutionalChargeByResidencyType ( 
	  AcademicInstitutionUniqueDWSID,  
	  InstitutionIdentifier,
	  AcademicYear,
	  ResidencyType,
	  PublishedYear,
	  Amount
    ) 
   SELECT
        IFNULL(D.AcademicInstitutionUniqueDWSID,-1),  
		S.InstitutionIdentifier,
		S.AcademicYear,
		S.ResidencyType,
		S.PublishedYear,
		S.Amount
   FROM
      V_od_InstitutionalChargeByResidencyType S
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
