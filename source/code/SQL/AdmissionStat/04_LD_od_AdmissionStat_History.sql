TRUNCATE TABLE od_AdmissionStat;

CALL pr_od_AdmissionStat_Load(2017::FLOAT);
CALL pr_od_AdmissionStat_Load(2018::FLOAT);
CALL pr_od_AdmissionStat_Load(2019::FLOAT);
