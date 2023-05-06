-- inserting set of data


insert into Customer (cID, cName, cPhoneNumber,cNationality, CAddress) values
(1,'ali','71658004','lb','beirut'),
(2,'mohammad','70658044','lb','beirut'),
(3,'walid','+964775516','iraq','iraq');

insert into Car (plateNumber, Brand,class,Model,Color) values
(659844,'nissan','sunny',2018, 'white'),
(659757,'renault','duster',2020,'gray'),
(667404,'hyundasi1e','i10',2016,'black');

insert into cDate (outDate,InDate,Duration) values
('2021-1-22','2021-1-24',2),
('2021-1-19','2021-1-24',5),
('2021-1-18','2021-1-18',30);

insert into Contract (conID,conPriceperDay,conRemainder,carPlateNumber,cID,outDate) values

(1,20,0,659844,2,'2021-1-22'),
(2,15,35,659757,1,'2021-1-19'),
(3,25,20,667404,3,'2021-1-18');

