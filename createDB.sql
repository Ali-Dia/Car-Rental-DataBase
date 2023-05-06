use master

Go

CREATE DATABASE DBproject
ON 
	( NAME = DBproject_dat,
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBproject.mdf')
	LOG ON 
		( NAME = 'DBproject_log',
			FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBproject')
			go