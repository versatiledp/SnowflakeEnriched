DROP VIEW IF EXISTS v_od_InstitutionalChargeByAcademicBranch;
CREATE OR REPLACE VIEW 
	v_od_InstitutionalChargeByAcademicBranch AS

SELECT AcademicYear,
InstitutionIdentifier,
LEFT(AcademicBranch.KEY 
	,POSITION('_', AcademicBranch.KEY, 1) - 1) AS 
				BranchName,
RIGHT(AcademicBranch.KEY, LEN(AcademicBranch.KEY) 
	- POSITION('_',AcademicBranch.KEY, 1)) AS ChargeType,
AcademicBranch.VALUE AS Amount
FROM Od_InstitutionalCharge
	,LATERAL FLATTEN(INPUT = > InstitutionalChargeByAcademicBranch) 
	AcademicBranch;
