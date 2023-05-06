/*
=================
Table: Car
=================
*/
use DBproject
go

create table Car( 
	
	PlateNumber integer not null,
	Brand		varchar(30) null,  
	class		varchar(30) null,
	Model		integer null,
	Color	    varchar (30) null,
primary key (PlateNumber)
)
go

/*
=================
Table: Customer
=================
*/
create table Customer ( 
 
	cID				integer not null,
	cName			varchar (30),
	cPhoneNumber	integer  null,
	cNationality	varchar (30) null,   
	cAddress		varchar( 30) null,
primary key (cID) 
)
go
/*
=================
Table: Date
=================
*/
create table cDate(
	OutDate		date not null,
	Indate		date null,
	Duration	integer null,
	primary key (OutDate)
)
go
/*
=================
Table: Contract
=================
*/
create table Contract( 
	
	conID				integer not null, 
	carPlateNumber		integer foreign key REFERENCES Car(PlateNumber)	not null,
	CID					integer foreign key REFERENCES Customer(CID)		not null,
	OutDate				date	foreign	key	REFERENCES cDate(OutDate)		not null,
	conPricePerDay		float null,
	conRemainder		float null,
	
primary key (conID)
)
go