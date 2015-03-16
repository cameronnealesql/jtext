IF OBJECT_ID(N'JTEXT.JDATE', N'FN') IS NOT NULL DROP FUNCTION JTEXT.JDATE;
GO

CREATE FUNCTION JTEXT.JDATE (@date AS DATETIME) RETURNS NVARCHAR(10)
AS

BEGIN
  DECLARE @year AS INT = YEAR(@date),
          @month AS INT = MONTH(@date),
          @day AS INT = DAY(@date),
          @result AS NVARCHAR(10) = N'';
  IF @year = 1988
    SET @result += CONCAT(N'昭和', @year - 1925);
  SET @result += CONCAT(N'年', @month, N'月', @day, N'日');
  RETURN @result;
END;
GO

SELECT JTEXT.JDATE('19881123');
