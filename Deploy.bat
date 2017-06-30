ECHO ON


REM DacpacPath variable to hold the DACPAC installed path
REM WORKSPACE variables to hold the .dacpac folder path. .dacpac file will generate when we build the DB project.
REM DB_Connection variable to hold the daatabase connection where to publish these changes
REM RunPostDeployScript variable decide to execute post deploy scripts or not.


SET DacpacPath="C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\"
SET "WORKSPACE=C:\Anil\Projects\Others\DotNetWorkSpace\DacpacPOC\DacpacTest\bin\Debug\DacpacTest.dacpac"
SET "DB_Connection=Data Source=localhost\sqlserver;Integrated Security=SSPI;Initial Catalog=dacpacTest;"
SET "SQLOperationType=BOTH"
SET "RunPostDeployScript=YES"

echo DataBase Connection : %DB_Connection%
ECHO dacpac WORKSPACE : %WORKSPACE%
ECHO RunPostDeployScript: %RunPostDeployScript%


IF %SQLOperationType% == DML CALL :Execute_DML_Script
IF %SQLOperationType% == DDL CALL :Execute_DDL_Script
IF %SQLOperationType% == BOTH CALL :Execute_Both
GOTO End


:Execute_DDL_Script
ECHO ***********Running DDL Changes***********
%DacpacPath%\sqlpackage.exe /Action:Publish /OverwriteFiles:True /SourceFile:"%WORKSPACE%" /tcs:"%DB_Connection%" /Variables:ExecPostDeployScript="%RunPostDeployScript%" /p:ScriptDatabaseOptions="False" /p:GenerateSmartDefaults="True" /p:BlockOnPossibleDataLoss="False" /p:DropObjectsNotInSource="False" /p:DoNotAlterReplicatedObjects="False" /p:DropConstraintsNotInSource="False" /p:DropDmlTriggersNotInSource="False" /p:DropIndexesNotInSource="False" /p:IgnoreIndexOptions="True" /p:IgnoreTableOptions="True" /p:IgnoreFillFactor="True" /p:IgnoreIndexPadding="True"  /p:IgnoreNotForReplication="True"  

REM /p:ExcludeObjectTypes="Aggregates;ApplicationRoles;Assemblies;AsymmetricKeys;BrokerPriorities;Certificates;Contracts;DatabaseRoles;DatabaseTriggers;Defaults;ExtendedProperties;Filegroups;FileTables;FullTextCatalogs;FullTextStoplists;MessageTypes;PartitionFunctions;PartitionSchemes;Permissions;Queues;RemoteServiceBindings;RoleMembership;Rules;ScalarValuedFunctions;SearchPropertyLists;Sequences;Services;Signatures;StoredProcedures;SymmetricKeys;Synonyms;TableValuedFunctions;UserDefinedDataTypes;UserDefinedTableTypes;ClrUserDefinedTypes;Users;Views;XmlSchemaCollections;Audits;Credentials;CryptographicProviders;DatabaseAuditSpecifications;Endpoints;ErrorMessages;EventNotifications;EventSessions;LinkedServerLogins;LinkedServers;Logins;Routes;ServerAuditSpecifications;ServerRoleMembership;ServerRoles;ServerTriggers" 
EXIT /B

:Execute_DML_Script
ECHO ***********Running DML Changes***********
%DacpacPath%\sqlpackage.exe /Action:Publish /OverwriteFiles:True /SourceFile:"%WORKSPACE%" /tcs:"%DB_Connection%" /Variables:ExecPostDeployScript="%RunPostDeployScript%" /p:ScriptDatabaseOptions="False" /p:GenerateSmartDefaults="True" /p:BlockOnPossibleDataLoss="True" /p:DropObjectsNotInSource="False"  /p:IgnoreIndexOptions="True" /p:IgnoreTableOptions="True" 

REM /p:ExcludeObjectTypes="Aggregates;ApplicationRoles;Assemblies;AsymmetricKeys;BrokerPriorities;Certificates;Contracts;DatabaseRoles;Defaults;ExtendedProperties;Filegroups;FileTables;FullTextCatalogs;FullTextStoplists;MessageTypes;PartitionFunctions;PartitionSchemes;Permissions;Queues;RemoteServiceBindings;RoleMembership;Rules;SearchPropertyLists;Sequences;Services;Signatures;SymmetricKeys;Synonyms;Tables;ClrUserDefinedTypes;Users;XmlSchemaCollections;Audits;Credentials;CryptographicProviders;DatabaseAuditSpecifications;Endpoints;ErrorMessages;EventNotifications;EventSessions;LinkedServerLogins;LinkedServers;Logins;Routes;ServerAuditSpecifications;ServerRoleMembership;ServerRoles;ServerTriggers"
EXIT /B

:Execute_Both
CALL :Execute_DDL_Script
CALL :Execute_DML_Script
GOTO End


:End
ECHO *** Deployment Completed ****