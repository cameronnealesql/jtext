--This UDF will detect whether or not a string contains certain CJK characters in a string of text
CREATE FUNCTION JTEXT.CJKDetect(text AS NVARCHAR(MAX))
  RETURNS BOOLEAN
  AS
  
  ;
