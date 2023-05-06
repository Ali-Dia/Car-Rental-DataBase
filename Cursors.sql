use DBproject
declare available_cars cursor
for
	select Car.PlateNumber, cDate.OutDate, cDate.InDate
	from Car,Contract,cDate
	where Contract.carPlateNumber = Car.PlateNumber AND Contract.OutDate = cDate.OutDate
open available_cars

declare @plate integer, @Odate date, @Idate date
fetch next from available_cars into @plate, @Odate,@Idate

while @@FETCH_STATUS = 0
begin
	if(@Odate > GETDATE() or @Idate < GETDATE() ) 
		print @plate
	else print 'None'
end
	
close available_cars
deallocate available_cars;
