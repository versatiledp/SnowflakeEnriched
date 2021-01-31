CREATE
	OR REPLACE VIEW v_od_InstitutionalChargeByResidencyType AS

--InDistrict
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuition' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedInDistrictTuitionYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictFees' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedInDistrictFeesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuitionFees' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedInDistrictTuitionFeesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuition' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedInDistrictTuitionYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictFees' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedInDistrictFeesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuitionFees' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedInDistrictTuitionFeesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuition' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedInDistrictTuitionYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictFees' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedInDistrictFeesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuitionFees' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedInDistrictTuitionFeesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuition' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedInDistrictTuitionYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictFees' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedInDistrictFeesYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'DistrictTuitionFees' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedInDistrictTuitionFeesYear3 AS Amount
FROM od_InstitutionalCharge S
--InState

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuition' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedInStateTuitionYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateFees' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedInStateFeesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuitionFees' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedInStateTuitionFeesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuition' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedInStateTuitionYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateFees' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedInStateFeesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuitionFees' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedInStateTuitionFeesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuition' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedInStateTuitionYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateFees' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedInStateFeesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuitionFees' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedInStateTuitionFeesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuition' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedInStateTuitionYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateFees' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedInStateFeesYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'InStateTuitionFees' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedInStateTuitionFeesYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

--OutOfState
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuition' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedOutOfStateTuitionYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateFees' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedOutOfStateFeesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuitionFees' AS ResidencyType
	,0 AS PublishedYear
	,S.PublishedOutOfStateTuitionFeesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuition' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedOutOfStateTuitionYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateFees' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedOutOfStateFeesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuitionFees' AS ResidencyType
	,1 AS PublishedYear
	,S.PublishedOutOfStateTuitionFeesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuition' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedOutOfStateTuitionYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateFees' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedOutOfStateFeesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuitionFees' AS ResidencyType
	,2 AS PublishedYear
	,S.PublishedOutOfStateTuitionFeesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuition' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedOutOfStateTuitionYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateFees' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedOutOfStateFeesYear3 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OutOfStateTuitionFees' AS ResidencyType
	,3 AS PublishedYear
	,S.PublishedOutOfStateTuitionFeesYear3 AS Amount
FROM od_InstitutionalCharge S;
