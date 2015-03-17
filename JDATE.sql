IF OBJECT_ID(N'JTEXT.JDATE', N'FN') IS NOT NULL DROP FUNCTION JTEXT.JDATE;
GO

CREATE FUNCTION JTEXT.JDATE (@date AS DATETIME) RETURNS NVARCHAR(10)
AS

BEGIN
  DECLARE @year AS INT = YEAR(@date),
          @month AS INT = MONTH(@date),
          @day AS INT = DAY(@date),
          @result AS NVARCHAR(10) = N'';
          
-- The logic is fine, but calculations can be simplified by using DATE rather than YEAR MONTH DAY separately
       IF @year > 1989 OR (@year = 1989 AND @month>= 1  AND @day >= 8)
            SET @result += CONCAT(N'平成', @year - 1988)
  ELSE IF @year > 1926 OR (@year = 1926 AND @month = 12 AND @day >= 25)
            SET @result += CONCAT(N'昭和', @year - 1925)
  ELSE IF @year > 1912 OR (@year = 1912 AND @month = 7 AND @day >= 30)
            SET @result += CONCAT(N'大正', @year - 1911);
  ELSE IF @year > 1868 OR (@year = 1868 AND @month = 9 AND @day >= 8)
            SET @result += CONCAT(N'明治', @year - 1867);
  SET @result += CONCAT(N'年', @month, N'月', @day, N'日');
  RETURN @result;
END;
GO
