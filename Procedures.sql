
CREATE PROCEDURE 
available_cars  @date1 date,  @date2 date,  @plate varchar(30) OUT
	AS

	
    SELECT car.PlateNumber  
    FROM car,contract,cDate
    WHERE contract.carPlateNumber = car.PlateNumber AND contract.OutDate = cDate.OutDate AND cDate.InDate < @date1

go




CREATE PROCEDURE check_available 
		@plate INT,  @msg VARCHAR(30) OUT
	AS

 
	IF EXISTS
	(   SELECT *
    FROM Car, Contract, cDate
    WHERE Car.PlateNumber = @plate AND contract.carPlateNumber = @plate AND contract.OutDate = cDate.OutDate 
    )
    Begin	
		set @msg = ''+@plate+' is available today to rent'
	end
	
	ELSE
	
	begin
    set	@msg = ''+@plate+' is not available today'
    end
	
	print @msg
     
	 
