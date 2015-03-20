-- The JTEXT schema must first be created in order for the following code to work. (See jtext/jtext_schema.sql)
IF OBJECT_ID(N'JTEXT.HIRAKATA', N'FN') IS NOT NULL DROP FUNCTION JTEXT.HIRAKATA;
GO

-- Input MUST be in Unicode
CREATE FUNCTION JTEXT.HIRAKATA(@HIRAGANA AS NVARCHAR(MAX))
  RETURNS NVARCHAR(MAX)

AS
BEGIN
  DECLARE @KATAKANA AS NVARCHAR(MAX) = N''
  DECLARE @POS AS INT = 0
  DECLARE @TEMPCHAR AS INT = 0

  WHILE @POS <= LEN(@HIRAGANA)
    BEGIN
      SET @TEMPCHAR = UNICODE(SUBSTRING(@HIRAGANA, @POS, 1));
      
      -- Hiragana characters have a UNICODE value between 12353 and 12438
      -- Any other values can be ignored
      IF (@TEMPCHAR >= 12353) AND (@TEMPCHAR <= 12438)
        BEGIN
          -- A Hiragana's UNICODE value is exactly 96 less than its Katakana equivalent
          -- So we add 96 to the Hiragana UNICODE value to get the Katakana UNICODE value
          SET @TEMPCHAR += 96
        END
        
      SET @KATAKANA = CONCAT(@KATAKANA, NCHAR(@TEMPCHAR));
      SET @POS += 1;
  END
  RETURN @KATAKANA;
END;
GO
