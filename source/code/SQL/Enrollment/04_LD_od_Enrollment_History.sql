TRUNCATE TABLE od_Enrollment;

CALL pr_od_Enrollment_Load(2017::FLOAT);
CALL pr_od_Enrollment_Load(2018::FLOAT);
CALL pr_od_Enrollment_Load(2019::FLOAT);
