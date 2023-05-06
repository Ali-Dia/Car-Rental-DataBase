set projloc=D:\DataBaseProject
set conn=-S LAPTOP-0FG006AQ -U Ali -P Data2
cls
echo Begining on top of MS Sqlserver DBMS engine...

osql %conn% -i %projloc%\SQL\createDB.sql -o %projloc%\log\createDB.log

echo database created

echo create table...

osql %conn% -i %projloc%\SQL\createTables.sql -o %projloc%\log\createTables.log

echo tables created

echo create trigger...

osql %conn% -i %projloc%\SQL\Triggers.sql -o %projloc%\log\Triggers.log

echo Triggers created

echo  create indexes...

osql %conn% -i %projloc%\SQL\indexes.sql -o %projloc%\log\indexes.log

echo indexes created

echo  create Views...

osql %conn% -i %projloc%\SQL\Views.sql -o %projloc%\log\Views.log

echo Views created


