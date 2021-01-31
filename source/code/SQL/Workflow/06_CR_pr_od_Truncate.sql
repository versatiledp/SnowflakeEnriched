CREATE OR REPLACE PROCEDURE pr_od_Truncate()
RETURNS STRING
LANGUAGE javascript
AS
$$
    
var arrTableName =[4];
    arrTableName[0] = 'od_AcademicInstitution'
    arrTableName[1] = 'od_Enrollment'
    arrTableName[2] = 'od_InstitutionalCharge'
    arrTableName[3] = 'od_AdmissionStat'
    

    var tableName ='';
    for (var j=0;j<arrTableName.length; j++)
    {
        tableName = arrTableName[j] 
        try
        {  
            snowflake.execute(
                {sqlText: `TRUNCATE TABLE `+tableName +`;`}
            );
      }
        catch(err)
        {
            return "Failed :" + err;
        }
    }
    return "success"
$$;