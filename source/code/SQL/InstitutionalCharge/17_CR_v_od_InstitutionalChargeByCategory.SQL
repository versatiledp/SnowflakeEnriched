CREATE
	OR REPLACE VIEW v_od_InstitutionalChargeByCategory AS

--BooksSupplies
SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'BooksSupplies' AS CategoryType
	,0 AS PublishedYear
	,S.BooksSuppliesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'BooksSupplies' AS CategoryType
	,1 AS PublishedYear
	,S.BooksSuppliesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'BooksSupplies' AS CategoryType
	,2 AS PublishedYear
	,S.BooksSuppliesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'BooksSupplies' AS CategoryType
	,3 AS PublishedYear
	,S.BooksSuppliesYear3 AS Amount
FROM od_InstitutionalCharge S
--OnCampusRoomBoard

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusRoomBoard' AS CategoryType
	,0 AS PublishedYear
	,S.OnCampusRoomBoardYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusRoomBoard' AS CategoryType
	,1 AS PublishedYear
	,S.OnCampusRoomBoardYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusRoomBoard' AS CategoryType
	,2 AS PublishedYear
	,S.OnCampusRoomBoardYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusRoomBoard' AS CategoryType
	,3 AS PublishedYear
	,S.OnCampusRoomBoardYear3 AS Amount
FROM od_InstitutionalCharge S
--OnCampusOtherExpenses

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusOtherExpenses' AS CategoryType
	,0 AS PublishedYear
	,S.OnCampusOtherExpensesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusOtherExpenses' AS CategoryType
	,1 AS PublishedYear
	,S.OnCampusOtherExpensesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusOtherExpenses' AS CategoryType
	,2 AS PublishedYear
	,S.OnCampusOtherExpensesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OnCampusOtherExpenses' AS CategoryType
	,3 AS PublishedYear
	,S.OnCampusOtherExpensesYear3 AS Amount
FROM od_InstitutionalCharge S
--OffCampusNotWithFamilyRoomBoard

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyRoomBoard' AS CategoryType
	,0 AS PublishedYear
	,S.OffCampusNotWithFamilyRoomBoardYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyRoomBoard' AS CategoryType
	,1 AS PublishedYear
	,S.OffCampusNotWithFamilyRoomBoardYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyRoomBoard' AS CategoryType
	,2 AS PublishedYear
	,S.OffCampusNotWithFamilyRoomBoardYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyRoomBoard' AS CategoryType
	,3 AS PublishedYear
	,S.OffCampusNotWithFamilyRoomBoardYear3 AS Amount
FROM od_InstitutionalCharge S
--OffCampusNotWithFamilyOtherExpenses

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyOtherExpenses' AS CategoryType
	,0 AS PublishedYear
	,S.OffCampusNotWithFamilyOtherExpensesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyOtherExpenses' AS CategoryType
	,1 AS PublishedYear
	,S.OffCampusNotWithFamilyOtherExpensesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyOtherExpenses' AS CategoryType
	,2 AS PublishedYear
	,S.OffCampusNotWithFamilyOtherExpensesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusNotWithFamilyOtherExpenses' AS CategoryType
	,3 AS PublishedYear
	,S.OffCampusNotWithFamilyOtherExpensesYear3 AS Amount
FROM od_InstitutionalCharge S
--OffCampusWithFamilyOtherExpenses

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusWithFamilyOtherExpenses' AS CategoryType
	,0 AS PublishedYear
	,S.OffCampusWithFamilyOtherExpensesYear0 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusWithFamilyOtherExpenses' AS CategoryType
	,1 AS PublishedYear
	,S.OffCampusWithFamilyOtherExpensesYear1 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusWithFamilyOtherExpenses' AS CategoryType
	,2 AS PublishedYear
	,S.OffCampusWithFamilyOtherExpensesYear2 AS Amount
FROM od_InstitutionalCharge S

UNION ALL

SELECT S.InstitutionIdentifier
	,S.AcademicYear
	,'OffCampusWithFamilyOtherExpenses' AS CategoryType
	,3 AS PublishedYear
	,S.OffCampusWithFamilyOtherExpensesYear3 AS Amount
FROM od_InstitutionalCharge S;
