IF OBJECT_ID(N'JTEXT.JDATE', N'FN') IS NOT NULL DROP FUNCTION JTEXT.JDATE;
GO

CREATE FUNCTION JTEXT.JDATE (@date AS DATETIME) RETURNS NVARCHAR(10)
AS

BEGIN
  DECLARE @result AS NVARCHAR(10) = N'';

       IF @date >= '19890108'
            SET @result += CONCAT(N'平成', YEAR(@date) - 1988)
  ELSE IF @date >= '19261225'
            SET @result += CONCAT(N'昭和', YEAR(@date) - 1925)
  ELSE IF @date >= '19120730'
            SET @result += CONCAT(N'大正', YEAR(@date) - 1911)
  ELSE IF @date >= '18680908'
            SET @result += CONCAT(N'明治', YEAR(@date) - 1867);

  SET @result += CONCAT(N'年', MONTH(@date), N'月', DAY(@date), N'日');
  
  RETURN @result;
  
END;
GO
