use DBproject
go
create view Local_Customers as

select cName
from Customer
where cNationality = 'Lebanese'
go

create view premium_Customer as

select count(*) as Contracts,cName
from Customer,Contract
where Customer.cID = Contract.CID
group by cName
having count(*) >= 4 ;
go

create view long_time_rental_Customer as

select MAX(cDate.Duration) as duration  ,Customer.cName
from Customer,Contract,cDate
where Customer.cID = Contract.cID and cDate.OutDate = Contract.OutDate
group by Customer.cName
go
