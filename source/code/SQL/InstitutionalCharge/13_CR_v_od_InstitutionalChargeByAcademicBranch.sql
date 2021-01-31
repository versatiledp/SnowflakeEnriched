CREATE
	OR REPLACE VIEW v_od_InstitutionalChargeByAcademicBranch AS

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Chiropractic' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Chiropractic_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Chiropractic'
	,'InStateRequiredFees'
	,S.Chiropractic_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Chiropractic'
	,'OutOfStateTuition'
	,S.Chiropractic_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Chiropractic'
	,'OutOfStateRequiredFees'
	,S.Chiropractic_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--Dentistry
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Dentistry' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Dentistry_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Dentistry'
	,'InStateRequiredFees'
	,S.Dentistry_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Dentistry'
	,'OutOfStateTuition'
	,S.Dentistry_OutOfStateTuition
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Dentistry'
	,'OutOfStateRequiredFees'
	,S.Dentistry_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--Medicine
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Medicine' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Medicine_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Medicine'
	,'InStateRequiredFees'
	,S.Medicine_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Medicine'
	,'OutOfStateTuition'
	,S.Medicine_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Medicine'
	,'OutOfStateRequiredFees'
	,S.Medicine_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--Optometry
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Optometry' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Optometry_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Optometry'
	,'InStateRequiredFees'
	,S.Optometry_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Optometry'
	,'OutOfStateTuition'
	,S.Optometry_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Optometry'
	,'OutOfStateRequiredFees'
	,S.Optometry_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--OsteopathicMedicine
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OsteopathicMedicine' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.OsteopathicMedicine_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OsteopathicMedicine'
	,'InStateRequiredFees'
	,S.OsteopathicMedicine_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OsteopathicMedicine'
	,'OutOfStateTuition'
	,S.OsteopathicMedicine_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OsteopathicMedicine'
	,'OutOfStateRequiredFees'
	,S.OsteopathicMedicine_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--Pharmacy
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Pharmacy' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Pharmacy_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Pharmacy'
	,'InStateRequiredFees'
	,S.Pharmacy_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Pharmacy'
	,'OutOfStateTuition'
	,S.Pharmacy_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Pharmacy'
	,'OutOfStateRequiredFees'
	,S.Pharmacy_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--Podiatry
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Podiatry' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Podiatry_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Podiatry'
	,'InStateRequiredFees'
	,S.Podiatry_InStateRequiredFees
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Podiatry'
	,'OutOfStateTuition'
	,S.Podiatry_OutOfStateTuition
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Podiatry'
	,'OutOfStateRequiredFees'
	,S.Podiatry_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--VeterinaryMedicine
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'VeterinaryMedicine' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.VeterinaryMedicine_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'VeterinaryMedicine'
	,'InStateRequiredFees'
	,S.VeterinaryMedicine_InStateRequiredFees
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'VeterinaryMedicine'
	,'OutOfStateTuition'
	,S.VeterinaryMedicine_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'VeterinaryMedicine'
	,'OutOfStateRequiredFees'
	,S.VeterinaryMedicine_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--Law
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Law' AS BranchName
	,'InStateTuition' AS ChargeType
	,S.Law_InStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Law'
	,'InStateRequiredFees'
	,S.Law_InStateRequiredFees AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Law'
	,'OutOfStateTuition'
	,S.Law_OutOfStateTuition AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'Law'
	,'OutOfStateRequiredFees'
	,S.Law_OutOfStateRequiredFees AS Amount
FROM od_InstitutionalCharge S;
