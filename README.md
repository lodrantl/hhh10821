# HHH-10821 demo

This is a simple but complete demo of Hibernate hbm2ddl.auto=update not working with MSSQL.
The prolem appears both on MSSQL 2016 on Windows Server and as shown in this demo in Linux version of MSSQL2017.


This is a Quarkus quickstart service just modified to work with MSSQL.
The docker config is added for MSSQL. 

Usage:
```bash
./mvnw clean package
docker-compose up -d mssql
#wait 20s for mssql to start and db to init
docker-compose up quickstart
```

An error like this will be produced:
```
quickstart_1_c75911a9eded | Caused by: org.hibernate.exception.SQLGrammarException: Error accessing table metadata
quickstart_1_c75911a9eded | 	at org.hibernate.exception.internal.SQLStateConversionDelegate.convert(SQLStateConversionDelegate.java:103)
quickstart_1_c75911a9eded | 	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)
quickstart_1_c75911a9eded | 	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:113)
quickstart_1_c75911a9eded | 	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:99)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.extract.internal.InformationExtractorJdbcDatabaseMetaDataImpl.convertSQLException(InformationExtractorJdbcDatabaseMetaDataImpl.java:102)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.extract.internal.InformationExtractorJdbcDatabaseMetaDataImpl.getTables(InformationExtractorJdbcDatabaseMetaDataImpl.java:345)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.extract.internal.DatabaseInformationImpl.getTablesInformation(DatabaseInformationImpl.java:120)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.internal.GroupedSchemaMigratorImpl.performTablesMigration(GroupedSchemaMigratorImpl.java:65)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.internal.AbstractSchemaMigrator.performMigration(AbstractSchemaMigrator.java:207)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.internal.AbstractSchemaMigrator.doMigration(AbstractSchemaMigrator.java:114)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.spi.SchemaManagementToolCoordinator.performDatabaseAction(SchemaManagementToolCoordinator.java:184)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.spi.SchemaManagementToolCoordinator.process(SchemaManagementToolCoordinator.java:73)
quickstart_1_c75911a9eded | 	at org.hibernate.internal.SessionFactoryImpl.<init>(SessionFactoryImpl.java:314)
quickstart_1_c75911a9eded | 	at io.quarkus.hibernate.orm.runtime.boot.FastBootEntityManagerFactoryBuilder.build(FastBootEntityManagerFactoryBuilder.java:68)
quickstart_1_c75911a9eded | 	... 12 more
quickstart_1_c75911a9eded | Caused by: com.microsoft.sqlserver.jdbc.SQLServerException: An object or column name is missing or empty. For SELECT INTO statements, verify each column has a name. For other statements, look for empty alias names. Aliases defined as "" or [] are not allowed. Change the alias to a valid name.
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerException.makeFromDatabaseError(SQLServerException.java:262)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.TDSTokenHandler.onEOF(tdsparser.java:258)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.TDSParser.parse(tdsparser.java:104)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.TDSParser.parse(tdsparser.java:26)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerConnection$1ConnectionCommand.doExecute(SQLServerConnection.java:2977)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.TDSCommand.execute(IOBuffer.java:7194)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerConnection.executeCommand(SQLServerConnection.java:2935)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerConnection.connectionCommand(SQLServerConnection.java:2982)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerConnection.setCatalog(SQLServerConnection.java:3305)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerDatabaseMetaData.switchCatalogs(SQLServerDatabaseMetaData.java:381)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerDatabaseMetaData.getResultSetFromStoredProc(SQLServerDatabaseMetaData.java:335)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerDatabaseMetaData.getResultSetWithProvidedColumnNames(SQLServerDatabaseMetaData.java:357)
quickstart_1_c75911a9eded | 	at com.microsoft.sqlserver.jdbc.SQLServerDatabaseMetaData.getTables(SQLServerDatabaseMetaData.java:540)
quickstart_1_c75911a9eded | 	at org.hibernate.tool.schema.extract.internal.InformationExtractorJdbcDatabaseMetaDataImpl.getTables(InformationExtractorJdbcDatabaseMetaDataImpl.java:333)
```