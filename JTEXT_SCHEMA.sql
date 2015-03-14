/* Create's the JTEXT schema, so that all JTEXT functions can be accessed through
JTEXT.FUNCTION_NAME(..)
Authorization given to the database owner, enabling access from anywhere inside the database.

Schemas can be deleted with the command:
DROP SCHEMA <schema name>; */
CREATE SCHEMA JTEXT AUTHORIZATION dbo;
GO
