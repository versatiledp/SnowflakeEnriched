    TRUNCATE TABLE od_AcademicInstitution;
    CALL pr_od_AcademicInstitution_Load(2017::FLOAT); 
    CALL pr_od_AcademicInstitution_Load(2018::FLOAT);
    CALL pr_od_AcademicInstitution_Load(2019::FLOAT);