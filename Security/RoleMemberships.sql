EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'SqlConnect';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'SqlConnect';

