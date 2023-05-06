use DBproject
go

create trigger td_Customer on Customer for delete as
begin
    declare
       @numrows  int

    select  @numrows = @@rowcount
    if @numrows = 0
       return

    /*  Cannot delete parent "Customer" if children still exist in "Contract"  */
    if exists (select 1
               from   Contract t2, deleted t1
               where  t2.cID = t1.cID)
       begin
          
                 print 'Children still exist in "Contract". Cannot delete parent "Customer"'
          
       end
	   
end
go

create trigger tu_Customer on Customer for update as

begin
   declare
      @numrows  int

      select  @numrows = @@rowcount
      if @numrows = 0
         return

      /*  Cannot modify parent code in "Customer" if children still exist in "Contract"  */
      if update(cID)
      begin
         if exists (select 1
                    from   Contract t2, inserted i1, deleted d1
                    where  t2.cID = d1.cID
                     and  (i1.cID != d1.cID))

            begin
                      print 'Children still exist in "Contract". Cannot modify parent code in "Customer".'
            end
	    end

 end
 go

 create trigger ti_Contract on Contract for insert as
begin
    declare
       @numrows  int      

    select  @numrows = @@rowcount
    if @numrows = 0
       return

    /*  Parent "Customer" must exist when inserting a child in "Contract"  */
    if update(cID)
    begin
       if (select count(*)
           from   Customer t1, inserted t2
           where  t1.cID = t2.conID) != @numrows
          begin

             print 'Parent does not exist in "Customer". Cannot create child in "Contract".'
		   end
    end
    /*  Parent "Car" must exist when inserting a child in "Contract"  */
    if update(carPlateNumber)
    begin
       if (select count(*)
           from   Car t1, inserted t2
           where  t1.PlateNumber = t2.carPlateNumber) != @numrows
          begin
                    print 'Parent does not exist in "car". Cannot create child in "Contract".'
          end
    end
    /*  Parent "cDate" must exist when inserting a child in "Contract"  */
    if update(OutDate)
    begin
       if (select count(*)
           from   cDate t1, inserted t2
           where  t1.OutDate = t2.OutDate) != @numrows
          begin
                    print 'Parent does not exist in "cDate". Cannot create child in "Contract".'
          end
    end


end


