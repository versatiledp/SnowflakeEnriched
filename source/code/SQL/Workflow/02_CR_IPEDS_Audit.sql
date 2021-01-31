CREATE OR REPLACE TABLE IPEDS_Audit
( StageName STRING,
  ProcedureName STRING,
  SourceTableName STRING,
  SourceRowCount NUMBER,
  TargetTableName STRING,
  PreRowCount NUMBER,
  PostRowCount NUMBER,
  ProcessDateTime DATETIME default current_timestamp
);