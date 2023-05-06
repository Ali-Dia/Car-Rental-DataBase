use DBproject
create   index  carPlateNumber_fk on Contract(
carPlateNumber 
)
go 


create index cID_fk on Contract(
cID
)
go

create index OutDate_fk on Contract(
 OutDate
)
go

