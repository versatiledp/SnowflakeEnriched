TRUNCATE TABLE IPEDS_Workflow;

INSERT INTO IPEDS_Workflow (
	StageName
	,ProcedureName
	,SourceTableName
	,TargetTableName
	,ExecutionOrder
	)
SELECT 'OD_TRUNCATE' AS StageName
	,'pr_od_Truncate()' AS ProcedureName
	,'' AS SourceTableName
	,'' TargetTableName
	,0 ExecutionOrder

UNION ALL

SELECT 'Od_HDR' AS StageName
	,'pr_od_AcademicInstitution_Load(@Year)' AS ProcedureName
	,'' AS SourceTableName
	,'od_AcademicInstitution' TargetTableName
	,1 ExecutionOrder

UNION ALL

SELECT 'SL_HDR' AS StageName
	,'pr_AcademicInstitution_Load(@Year)' AS ProcedureName
	,'od_AcademicInstitution' AS SourceTableName
	,'AcademicInstitution' TargetTableName
	,2 ExecutionOrder

UNION ALL

SELECT 'Od_EFFY' AS StageName
	,'pr_od_Enrollment_Load(@Year)' AS ProcedureName
	,'' AS SourceTableName
	,'od_Enrollment' TargetTableName
	,3 ExecutionOrder

UNION ALL

SELECT 'SL_EFFY' AS StageName
	,'pr_Enrollment_Load(@Year)' AS ProcedureName
	,'od_Enrollment' AS SourceTableName
	,'Enrollment' TargetTableName
	,4 ExecutionOrder

UNION ALL

SELECT 'OD_IC' AS StageName
	,'pr_od_InstitutionalCharge_Load(@Year)' AS ProcedureName
	,'' AS SourceTableName
	,'od_InstitutionalCharge' TargetTableName
	,5 ExecutionOrder

UNION ALL

SELECT 'SL_IC' AS StageName
	,'pr_InstitutionalCharge_Load(@Year)' AS ProcedureName
	,'od_InstitutionalCharge' AS SourceTableName
	,'InstitutionalCharge' TargetTableName
	,6 ExecutionOrder

UNION ALL

SELECT 'SL_ICBranch' AS StageName
	,'pr_InstitutionalChargeByAcademicBranch_Load(@Year)' AS 
	ProcedureName
	,'' AS SourceTableName
	,'InstitutionalChargeByAcademicBranch' TargetTableName
	,7 ExecutionOrder

UNION ALL

SELECT 'SL_ICPublication' AS StageName
	,'pr_InstitutionalChargeByPublication_Load(@Year)' AS ProcedureName
	,'' AS SourceTableName
	,'InstitutionalChargeByPublication' TargetTableName
	,8 ExecutionOrder

UNION ALL

SELECT 'SL_ICCategory' AS StageName
	,'pr_InstitutionalChargeByCategory_Load(@Year)' AS ProcedureName
	,'' AS SourceTableName
	,'InstitutionalChargeByCategory' TargetTableName
	,9 ExecutionOrder

UNION ALL

SELECT 'OD_ADM' AS StageName
	,'pr_od_AdmissionStat_Load(@Year)' AS ProcedureName
	,'' AS SourceTableName
	,'od_AdmissionStat' TargetTableName
	,10 ExecutionOrder

UNION ALL

SELECT 'SL_ADM' AS StageName
	,'pr_AdmissionStat_Load(@Year)' AS ProcedureName
	,'od_AdmissionStat' AS SourceTableName
	,'AdmissionStat' TargetTableName
	,11 ExecutionOrder

UNION ALL

SELECT 'OD_CM' AS StageName
	,'pr_od_CodeMapping_Load()' AS ProcedureName
	,'' AS SourceTableName
	,'' TargetTableName
	,12 ExecutionOrder

UNION ALL

SELECT 'SL_CM' AS StageName
	,'pr_CodeMapping_Load()' AS ProcedureName
	,'' AS SourceTableName
	,'' TargetTableName
	,13 ExecutionOrder;
