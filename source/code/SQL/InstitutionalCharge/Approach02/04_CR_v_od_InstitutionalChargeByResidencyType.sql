DROP VIEW IF EXISTS v_od_InstitutionalChargeByResidencyType;
  
CREATE OR REPLACE VIEW 
	v_od_InstitutionalChargeByResidencyType AS
SELECT  AcademicYear,
InstitutionIdentifier,
LEFT(ChargeByResidencyType.Key,
	POSITION('Year',ChargeByResidencyType.Key,1)-1)
		AS ResidencyType,
RIGHT(ChargeByResidencyType.Key,1) AS PublishedYear, 
ChargeByResidencyType.VALUE AS Amount
FROM Od_InstitutionalCharge,
	  LATERAL FLATTEN(INPUT => InstitutionalChargeByResidencyType) 
		ChargeByResidencyType
