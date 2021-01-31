CREATE OR REPLACE PROCEDURE 
	pr_od_InstitutionalCharge_Load(YEAR FLOAT)
RETURNS STRING
LANGUAGE javascript
EXECUTE
	AS OWNER
AS
$$
var sql_command = `
INSERT INTO od_InstitutionalCharge
(	
InstitutionIdentifier,
InDistrictAverageTuitionFullTimeUndergraduates,
InDistrictRequiredFeesFullTimeUndergraduates,
InDistrictPerCreditHourChargeForPartTimeUndergraduates,
InStateAverageTuitionFullTimeUndergraduates,
InStateRequiredFeesFullTimeUndergraduates,
InStatePerCreditHourChargeForPartTimeUndergraduates,
OutOfStateAverageTuitionFullTimeUndergraduates,
OutOfStateRequiredFeesFullTimeUndergraduates,
OutOfStatePerCreditHourChargeForPartTimeUndergraduates,
InDistrictAverageTuitionFullTimeGraduates,
InDistrictRequiredFeesFullTimeGraduates,
InDistrictPerCreditHourChargePartTimeGraduates,
InStateAverageTuitionFullTimeGraduates,
InStateRequiredFeesFullTimeGraduates,
InStatePerCreditHourChargePartTimeGraduates,
OutOfStateAverageTuitionFullTimeGraduates,
OutOfStateRequiredFeesFullTimeGraduates,
OutOfStatePerCreditHourChargePartTimeGraduate,
InstitutionalChargeByAcademicBranch,
InstitutionalChargeByResidencyType,
InstitutionalChargeByCategory,
AcademicYear,
IngestedFileName,
RowNumber
)
SELECT
$1:UNITID   :: VARCHAR
	AS InstitutionIdentifier,
$1:TUITION1 :: INTEGER
	AS InDistrictAverageTuitionFullTimeUndergraduates,
$1:FEE1     :: INTEGER
	AS InDistrictRequiredFeesFullTimeUndergraduates,
$1:HRCHG1   :: INTEGER
	AS InDistrictPerCreditHourChargeForPartTimeUndergraduates,
$1:TUITION2 :: INTEGER
	AS InStateAverageTuitionFullTimeUndergraduates,
$1:FEE2     :: INTEGER
	AS InStateRequiredFeesFullTimeUndergraduates,
$1:HRCHG2   :: INTEGER
	AS InStatePerCreditHourChargeForPartTimeUndergraduates,
$1:TUITION3 :: INTEGER
	AS OutOfStateAverageTuitionFullTimeUndergraduates,
$1:FEE3     :: INTEGER
	AS OutOfStateRequiredFeesFullTimeUndergraduates,
$1:HRCHG3   :: INTEGER
	AS OutOfStatePerCreditHourChargeForPartTimeUndergraduates,
$1:TUITION5 :: INTEGER
	AS InDistrictAverageTuitionFullTimeGraduates,
$1:FEE5     :: INTEGER
	AS InDistrictRequiredFeesFullTimeGraduates,
$1:HRCHG5   :: INTEGER
	AS InDistrictPerCreditHourChargePartTimeGraduates,
$1:TUITION6 :: INTEGER
	AS InStateAverageTuitionFullTimeGraduates,
$1:FEE6     :: INTEGER
	AS InStateRequiredFeesFullTimeGraduates,
$1:HRCHG6   :: INTEGER
	AS InStatePerCreditHourChargePartTimeGraduates,
$1:TUITION7 :: INTEGER
	AS OutOfStateAverageTuitionFullTimeGraduates,
$1:FEE7     :: INTEGER
	AS OutOfStateRequiredFeesFullTimeGraduates,
$1:HRCHG7   :: INTEGER
	AS OutOfStatePerCreditHourChargePartTimeGraduate,
	
OBJECT_CONSTRUCT(
	'Chiropractic_InStateTuition'
		,$1:ISPROF1::INTEGER,
	'Chiropractic_InStateRequiredFees'
		,$1:ISPFEE1::INTEGER,
	'Chiropractic_OutOfStateTuition'
		,$1:OSPROF1::INTEGER,
	'Chiropractic_OutOfStateRequiredFees'
		,$1:OSPFEE1::INTEGER, 
	'Dentistry_InStateTuition'
		,$1:ISPROF2::INTEGER,
	'Dentistry_InStateRequiredFees'
		,$1:ISPFEE2::INTEGER,
	'Dentistry_OutOfStateTuition'
		,$1:OSPROF2::INTEGER,
	'Dentistry_OutOfStateRequiredFees'
		,$1:OSPFEE2::INTEGER, 
	'Medicine_InStateTuition'
		,$1:ISPROF3::INTEGER,
	'Medicine_InStateRequiredFees'
		,$1:ISPFEE3::INTEGER,
	'Medicine_OutOfStateTuition'
		,$1:OSPROF3::INTEGER,
	'Medicine_OutOfStateRequiredFees'
		,$1:OSPFEE3::INTEGER, 
	'Optometry_InStateTuition'
		,$1:ISPROF4::INTEGER,
	'Optometry_InStateRequiredFees'
		,$1:ISPFEE4::INTEGER,
	'Optometry_OutOfStateTuition'
		,$1:OSPROF4::INTEGER,
	'Optometry_OutOfStateRequiredFees'
		,$1:OSPFEE4::INTEGER, 
	'OsteopathicMedicine_InStateTuition'
		,$1:ISPROF5::INTEGER,
	'OsteopathicMedicine_InStateRequiredFees'
		,$1:ISPFEE5::INTEGER,
	'OsteopathicMedicine_OutOfStateTuition'
		,$1:OSPROF5::INTEGER,
	'OsteopathicMedicine_OutOfStateRequiredFees'
		,$1:OSPFEE5::INTEGER, 
	'Pharmacy_InStateTuition'
		,$1:ISPROF6::INTEGER,
	'Pharmacy_InStateRequiredFees'
		,$1:ISPFEE6::INTEGER,
	'Pharmacy_OutOfStateTuition'
		,$1:OSPROF6::INTEGER,
	'Pharmacy_OutOfStateRequiredFees'
		,$1:OSPFEE6::INTEGER, 
	'Podiatry_InStateTuition'
		,$1:ISPROF7::INTEGER,
	'Podiatry_InStateRequiredFees'
		,$1:ISPFEE7::INTEGER,
	'Podiatry_OutOfStateTuition'
		,$1:OSPROF7::INTEGER,
	'Podiatry_OutOfStateRequiredFees'
		,$1:OSPFEE7::INTEGER, 
	'VeterinaryMedicine_InStateTuition'
		,$1:ISPROF8::INTEGER,
	'VeterinaryMedicine_InStateRequiredFees'
		,$1:ISPFEE8::INTEGER,
	'VeterinaryMedicine_OutOfStateTuition'
		,$1:OSPROF8::INTEGER,
	'VeterinaryMedicine_OutOfStateRequiredFees'
		,$1:OSPFEE8::INTEGER,   
	'Law_InStateTuition'
		,$1:ISPROF9::INTEGER,
	'Law_InStateRequiredFees'
		,$1:ISPFEE9::INTEGER,
	'Law_OutOfStateTuition'
		,$1:OSPROF9::INTEGER,
	'Law_OutOfStateRequiredFees'
		,$1:OSPFEE9::INTEGER 
	)
	AS InstitutionalChargeByAcademicBranch,
	
OBJECT_CONSTRUCT(
	'InDistrictTuitionYear0'
		,$1:CHG1AT0::INTEGER,
	'InDistrictFeesYear0'
		,$1:CHG1AF0::INTEGER,
	'InDistrictTuitionFeesYear0'
		,$1:CHG1AY0::INTEGER,

	'InDistrictTuitionYear1'
		,$1:CHG1AT1::INTEGER,
	'InDistrictFeesYear1'
		,$1:CHG1AF1::INTEGER,
	'InDistrictTuitionFeesYear1'
		,$1:CHG1AY1::INTEGER,

	'InDistrictTuitionYear2'
		,$1:CHG1AT2::INTEGER,
	'InDistrictFeesYear2'
		,$1:CHG1AF2::INTEGER,
	'InDistrictTuitionFeesYear2'
		,$1:CHG1AY2::INTEGER,

	'InDistrictTuitionYear3'
		,$1:CHG1AT3::INTEGER,
	'InDistrictFeesYear3'
		,$1:CHG1AF3::INTEGER,
	'InDistrictTuitionFeesYear3'
		,$1:CHG1AY3::INTEGER,

	'InStateTuitionYear0'
		,$1:CHG2AT0::INTEGER,
	'InStateFeesYear0'
		,$1:CHG2AF0::INTEGER,
	'InStateTuitionFeesYear0'
		,$1:CHG2AY0::INTEGER,

	'InStateTuitionYear1'
		,$1:CHG2AT1::INTEGER,
	'InStateFeesYear1'
		,$1:CHG2AF1::INTEGER,
	'InStateTuitionFeesYear1'
		,$1:CHG2AY1::INTEGER,

	'InStateTuitionYear2'
		,$1:CHG2AT2::INTEGER,
	'InStateFeesYear2'
		,$1:CHG2AF2::INTEGER,
	'InStateTuitionFeesYear2'
		,$1:CHG2AY2::INTEGER,

	'InStateTuitionYear3'
		,$1:CHG2AT3::INTEGER,
	'InStateFeesYear3'
		,$1:CHG2AF3::INTEGER,
	'InStateTuitionFeesYear3'
		,$1:CHG2AY3::INTEGER,

	'OutOfStateTuitionYear0'
		,$1:CHG3AT0::INTEGER,
	'OutOfStateFeesYear0'
		,$1:CHG3AF0::INTEGER,
	'OutOfStateTuitionFeesYear0'
		,$1:CHG3AY0::INTEGER,
	'OutOfStateTuitionYear1'
		,$1:CHG3AT1::INTEGER,
	'OutOfStateFeesYear1'
		,$1:CHG3AF1::INTEGER,
	'OutOfStateTuitionFeesYear1'
		,$1:CHG3AY1::INTEGER,
	'OutOfStateTuitionYear2'
		,$1:CHG3AT2::INTEGER,
	'OutOfStateFeesYear2'
		,$1:CHG3AF2::INTEGER,
	'OutOfStateTuitionFeesYear2'
		,$1:CHG3AY2::INTEGER,
	'OutOfStateTuitionYear3'
		,$1:CHG3AT3::INTEGER,
	'OutOfStateFeesYear3'
		,$1:CHG3AF3::INTEGER,
	'OutOfStateTuitionFeesYear3'
		,$1:CHG3AY3::INTEGER
	)
	AS InstitutionalChargeByResidencyType,
OBJECT_CONSTRUCT (
	'BooksSuppliesYear0',                      $1:CHG4AY0::INTEGER,
	'BooksSuppliesYear1',                      $1:CHG4AY1::INTEGER,
	'BooksSuppliesYear3',                      $1:CHG4AY3::INTEGER, 
	'BooksSuppliesYear2',                      $1:CHG4AY2::INTEGER, 
	'OnCampusRoomBoardYear0',                  $1:CHG5AY0::INTEGER, 
	'OnCampusRoomBoardYear1',                  $1:CHG5AY1::INTEGER, 
	'OnCampusRoomBoardYear2',                  $1:CHG5AY2::INTEGER, 
	'OnCampusRoomBoardYear3',                  $1:CHG5AY3::INTEGER, 
	'OnCampusOtherExpensesYear0',              $1:CHG6AY0::INTEGER, 
	'OnCampusOtherExpensesYear1',              $1:CHG6AY1::INTEGER, 
	'OnCampusOtherExpensesYear2',              $1:CHG6AY2::INTEGER, 
	'OnCampusOtherExpensesYear3',              $1:CHG6AY3::INTEGER, 
	'OffCampusNotWithFamilyRoomBoardYear0',    $1:CHG7AY0::INTEGER, 
	'OffCampusNotWithFamilyRoomBoardYear1',    $1:CHG7AY1::INTEGER, 
	'OffCampusNotWithFamilyRoomBoardYear2',    $1:CHG7AY2::INTEGER, 
	'OffCampusNotWithFamilyRoomBoardYear3',    $1:CHG7AY3::INTEGER, 
	'OffCampusNotWithFamilyOtherExpensesYear0',$1:CHG8AY0::INTEGER, 
	'OffCampusNotWithFamilyOtherExpensesYear1',$1:CHG8AY1::INTEGER, 
	'OffCampusNotWithFamilyOtherExpensesYear2',$1:CHG8AY2::INTEGER, 
	'OffCampusNotWithFamilyOtherExpensesYear3',$1:CHG8AY3::INTEGER, 
	'OffCampusWithFamilyOtherExpensesYear0',   $1:CHG9AY0::INTEGER, 
	'OffCampusWithFamilyOtherExpensesYear1',   $1:CHG9AY1::INTEGER, 
	'OffCampusWithFamilyOtherExpensesYear2',   $1:CHG9AY2::INTEGER, 
	'OffCampusWithFamilyOtherExpensesYear3',   $1:CHG9AY3::INTEGER 
	)
	AS InstitutionalChargeByCategory,
  LEFT(MetaData$FileName, 4)
	AS AcademicYear,
  metadata$filename IngestedFileName,
  metadata$file_row_number RowNumber
FROM
  @IPEDS_IC
WHERE LEFT(MetaData$FileName,4) = ` + YEAR.toString()+`;`

try {
	snowflake.execute (
	  {sqlText: sql_command}
	  );
	}
catch (err) {
	return "Failed: " + err;  // Return a success/error indicator.
	}
return "success.";  // Return a success/error indicator.

$$
;
