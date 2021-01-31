CREATE OR REPLACE FUNCTION
    Hash_Key(SCDKeys array)  
    RETURNS VARCHAR(50)
  as 
  $$
    UPPER(SHA1(ConcatColumns(SCDKeys)))
  $$
;

