-- Create an Admin

create login jawad
with password = 'Test123'
go

sp_addrole fullaccess
grant select,insert,update,delete on 
Contracts to fullaccess

-- Create employee

create login ali
with password = 'Test123'
go

sp_addrole emaccess
grant select,update on 
Contracts to emaccess

drop database DBproject