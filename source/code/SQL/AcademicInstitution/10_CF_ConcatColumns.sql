CREATE OR REPLACE FUNCTION
    ConcatColumns(COLUMNLIST array)
    RETURNS varchar
    LANGUAGE javascript
  AS
  $$
    function return_column_string(ColumnArray) {
      var ColumnString = '';
      var arrayLength = ColumnArray.length;
      for (var i = 0; i < arrayLength; i++) {
        if (i>0) ColumnString += ';' 
        ColumnString += typeof(ColumnArray[i]) 
			== 'undefined' ? '' : ColumnArray[i] ;
      }
      return ColumnString.toUpperCase().trim();
    }
  return return_column_string(COLUMNLIST);
  $$
;
