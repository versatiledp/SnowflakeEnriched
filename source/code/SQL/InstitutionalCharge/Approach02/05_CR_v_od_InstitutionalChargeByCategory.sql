DROP VIEW IF EXISTS v_od_InstitutionalChargeByCategory;
 
CREATE OR REPLACE VIEW v_od_InstitutionalChargeByCategory AS
SELECT  AcademicYear,
InstitutionIdentifier,ChargeByCategory.Key,
LEFT(ChargeByCategory.Key,POSITION('Year',ChargeByCategory.Key,1)-1)
		AS CategoryType,
RIGHT(ChargeByCategory.Key,1) AS PublishedYear,
ChargeByCategory.VALUE AS Amount
FROM Od_InstitutionalCharge,
	 LATERAL FLATTEN(INPUT => InstitutionalChargeByCategory) 
		ChargeByCategory
