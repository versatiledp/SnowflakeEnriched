TRUNCATE TABLE od_InstitutionalCharge;

CALL pr_od_InstitutionalCharge_Load(2017::FLOAT);
CALL pr_od_InstitutionalCharge_Load(2018::FLOAT);
CALL pr_od_InstitutionalCharge_Load(2019::FLOAT);