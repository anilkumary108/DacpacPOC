# DACPAC Notes

To create a new project and import existing database schema
	1. Click File, New, then Project. In the New Project dialog box, select SQL Server in the left pane. Notice that there is only one type of database project: the SQL Server Database Project. There is no platform-specific project as in previous versions of Visual Studio. You will be able to set your target platform in the Project Settings dialog box after the project has been created. Such task will be covered in the How to: Change Target Platform and Publish a Database Project topic.
	2. Change the name of the project to <ProjectName> and click OK to create the new project.
	3. Right-click the newly created <ProjectName> project in Solution Explorer, select Import, then Database.
The Import Database dialog box opens. In the Source database connection section, click Choose a database and select <ProjectName>. If <ProjectName> is absent from the dropdown list, use the New Connection button to edit the Connection Properties.
	4. In the Import Settings section, notice the options for importing specific objects and settings, and creating folders for each schema and/or object type. For an organized hierarchy of all your database objects, accept all default settings and click Start.
	5. The Import Database dialog shows a progress bar and displays a list of objects SSDT is importing. When the import operation has completed, click Finish to exit the final screen.
	6. Examine the hierarchy in the Solution Explorer. Expand the dbo folder and you will find separate Functions, Tables and Views folders. Notice that the tables and function are grouped under their schema folders.
	7. Double-click Products.sql under Tables. The Table Designer opens, showing the visual interpretation of the table in the Columns Grid, and the script definition of the table in the Script Pane. This is identical to what we see in the Connected Database Development section.
	8. Uncheck the Allow Nulls box for the CustomerId column. Press CTRL + S to save the file.
Right-click the <ProjectName> project in Solution Explorer and select Build to build the database project.