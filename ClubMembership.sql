CREATE TABLE customer_details(
  customer_id int NOT NULL,
  customer_fname varchar(20) NOT NULL,
  customer_lname varchar(20) NOT NULL,
  customer_addr varchar(20) not null,
   customer_club varchar(20) not null,
   customer_membershiplan int not null,
   customer_phone varchar(20) not null,
  PRIMARY KEY(customer_id)
);
CREATE TABLE customer_details_check(
  customer_id int NOT NULL,
  customer_fname varchar(20) NOT NULL,
  customer_lname varchar(20) NOT NULL,
  customer_addr varchar(20) not null,
   customer_club varchar(20) not null,
   customer_membershiplan int not null,
   customer_phone varchar(20) not null,
  PRIMARY KEY(customer_id)
);

CREATE TABLE club(
	club_id int not null,
	club_name varchar(20) not null,
	club_location varchar(20) not null,
	PRIMARY KEY(club_id)
);
CREATE TABLE logreg(
	customer_id int not null,
    logtime datetime not null
);

CREATE TABLE employee_details(
  employee_id int NOT NULL,
  employee_fname varchar(20) NOT NULL,
  employee_lname varchar(20) NOT NULL,
  employee_addr varchar(20) not null,
  employee_phone varchar(20) not null,
  employee_club varchar(20) not null,
  
  PRIMARY KEY(employee_id)
);

CREATE TABLE club_membership(
  club_membership_id int not null,
  customer_id int not null,
  club_id int not null,
  FOREIGN KEY(customer_id) REFERENCES customer_details(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(club_id) REFERENCES club(club_id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(club_membership_id)
  
);

CREATE TABLE amenity(
   type varchar(20) not null,
   Aminity_user_id int not null,
   PRIMARY KEY(type)
);

CREATE TABLE club_amenities(
  amenities varchar(20) not null,
  club_id int not null,
  FOREIGN KEY(club_id) REFERENCES club(club_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- 2022-11-29 21:08:19
UPDATE customer_details SET start_date=now();
UPDATE customer_details SET start_date="2021-11-29 21:08:19" where customer_id>104;
UPDATE customer_details SET start_date="2022-05-29 21:08:19" where customer_id>111;





-----------------------------------------------------------------
--Inserting data

--customer_details
INSERT INTO customer_details values(108,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823176542');
INSERT INTO customer_details values(104,'Christiano','Ronaldo','888 Bel St. London','Royal Orchid',1,'9462438153');
INSERT INTO customer_details values(105,'Chris','Hemsworth','223 Kamikaze St. Tokyo','Clarks Exotica',2,'88745619820');
INSERT INTO customer_details values(108,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823176542');
INSERT INTO customer_details values(106,'Henry','Cavill','998 Hiroshima St. Tokyo','Clarks Exotica',3,'9370157284');
INSERT INTO customer_details values(101,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823193542');
INSERT INTO customer_details values(103,'Leo','Messi','428 Dollar St. London','Signature Club',3,'7833193545');
INSERT INTO customer_details values(102,'Dare','Devil','623 Church St. Newyork','Palm Meadows',2,'9992376342');
INSERT INTO customer_details values(107,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823193542');
INSERT INTO customer_details values(109,'Dare','Devil','623 Church St. Newyork','Palm Meadows',2,'9992376342');
INSERT INTO customer_details values(110,'Leo','Messi','428 Dollar St. London','Signature Club',3,'7833193545');
INSERT INTO customer_details values(111,'Christiano','Ronaldo','888 Bel St. London','Royal Orchid',1,'9462438153');
INSERT INTO customer_details values(112,'Chris','Hemsworth','223 Kamikaze St. Tokyo','Clarks Exotica',2,'88745619820');
INSERT INTO customer_details values(113,'Henry','Cavill','998 Hiroshima St. Tokyo','Clarks Exotica',3,'9370157284');

--customer_details_check
INSERT INTO customer_details_check values(103,'Leo','Messi','428 Dollar St. London','Signature Club',3,'7833193545');
INSERT INTO customer_details_check values(102,'Dare','Devil','623 Church St. Newyork','Palm Meadows',2,'9992376342');
INSERT INTO customer_details_check values(107,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823193542');
INSERT INTO customer_details_check values(109,'Dare','Devil','623 Church St. Newyork','Palm Meadows',2,'9992376342');
INSERT INTO customer_details_check values(110,'Leo','Messi','428 Dollar St. London','Signature Club',3,'7833193545');
INSERT INTO customer_details_check values(108,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823176542');
INSERT INTO customer_details_check values(204,'Christiano','Ronaldo','888 Bel St. London','Royal Orchid',1,'9462438153');
INSERT INTO customer_details_check values(205,'Chris','Hemsworth','223 Kamikaze St. Tokyo','Clarks Exotica',2,'88745619820');
INSERT INTO customer_details_check values(208,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823176542');
INSERT INTO customer_details_check values(206,'Henry','Cavill','998 Hiroshima St. Tokyo','Clarks Exotica',3,'9370157284');
INSERT INTO customer_details_check values(201,'John','Wick','123 Bel St. Newyork','Royal Orchid',1,'9823193542');


--employee_details
INSERT INTO employee_details values(201,'emp','1','123 Bel St. Newyork','9823193542','Royal Orchid');
INSERT INTO employee_details values(202,'emp','2','613 Church St. Newyork','9992376342','Palm Meadows');
INSERT INTO employee_details values(203,'emp','3','418 Dollar St. London','7833193545','Signature Club');
INSERT INTO employee_details values(204,'emp','4','215 Bel St. London','9462438153','Royal Orchid');
INSERT INTO employee_details values(205,'emp','5','225 Kamikaze St. Tokyo','88745619820','Clarks Exotica');
INSERT INTO employee_details values(206,'emp','6','298 Hiroshima St. Tokyo','9370157284','Clarks Exotica');

--club
INSERT INTO club values(1,'Royal Orchid','London');
INSERT INTO club values(2,'Royal Orchid','Newyork');
INSERT INTO club values(3,'Palm Meadows','Newyork');
INSERT INTO club values(4,'Signature Club','London');
INSERT INTO club values(5,'Clarks Exotica','Tokyo');

--club_membership
INSERT INTO club_membership values(302,101,2);
INSERT INTO club_membership values(303,102,3);
INSERT INTO club_membership values(304,103,4);
INSERT INTO club_membership values(301,104,1);
INSERT INTO club_membership values(305,105,5);
INSERT INTO club_membership values(306,106,5);

--amenity
INSERT INTO amenity values('Swimmingpool',401);
INSERT INTO amenity values('Gym',402);
INSERT INTO amenity values('IndoorGames',403);
INSERT INTO amenity values('Badminton',404);
INSERT INTO amenity values('Yoga room',405);
INSERT INTO amenity values('Billiards',406);
INSERT INTO amenity values('Table tennis',407);
INSERT INTO amenity values('Zumba room',408);
INSERT INTO amenity values('Golf court',409);
INSERT INTO amenity values('Tennis court',410);
INSERT INTO amenity values('Squash room',411);





---------------------
--joins
select * from customer_details inner join club on club.club_name=customer_details.customer_club;

create view temp as select * from customer_details inner join club on club.club_name = customer_details.customer_club;
select * from temp inner join club_membership on temp.club_id=club_membership.club_id;

select * from club inner join club_membership on club.club_id=club_membership.club_id;

------------------------------------------------------------------------
--aggregate
SELECT
    customer_membershiplan as most_frequent_plans
FROM
    (
        SELECT
            customer_membershiplan,
            cnt,
            DENSE_RANK() OVER(
                ORDER BY
                    cnt DESC
            ) as rnk
        FROM
            (
                SELECT
                    customer_membershiplan,
                    COUNT(*) as cnt
                FROM
                    customer_details
                GROUP By
                    customer_membershiplan
            )x
    )y 
WHERE
    rnk = 1;


SELECT
    customer_club,
    COUNT(*) as cnt
FROM
    customer_details
GROUP By
    customer_club

-----------------------------------------------------------------------------
-- set operations
--union
SELECT customer_fname,customer_lname,customer_id FROM customer_details
UNION
SELECT club_id,customer_id,club_membership_id FROM club_membership
ORDER BY customer_id;

---intersection
SELECT *
     FROM customer_details
     LEFT JOIN club
     ON customer_details.customer_club = club.club_name
INTERSECT
     SELECT  *
     FROM customer_details_check
     RIGHT JOIN club
     ON customer_details_check.customer_club = club.club_name;

--------------------------------------------------------------------------------

-- trigger querie
delimiter $$
CREATE OR REPLACE TRIGGER phone_no_changes 
BEFORE INSERT ON customer_details 
FOR EACH ROW  
BEGIN
    DECLARE x varchar(20);
    declare mess varchar(100);
    set mess = "ERROR: Invalid phone number";
    -- set x="yes";
    set x=fphno(new.phone_no);
    
    if(x="NO") THEN 
        signal sqlstate '45000'
        set message_text = mess;
    end if;
END; 
$$
delimiter ;

-- function
delimiter $$
CREATE OR REPLACE FUNCTION fphno(phone_no VARCHAR(20))
RETURNS varchar(20)
BEGIN 
    declare x varchar(15);
    declare phonenum int;
    set phonenum = cast(phone_no as int);
    -- return phone_no;
    IF((phonenum<1000000000 or phonenum>9999999999)) THEN
        set x = "NO";
    ELSE
        set x = "YES";
    end if;
    return x;
END; 
$$  
delimiter ;

---------------------------------------------------------------------------

delimiter $$
CREATE OR REPLACE TRIGGER checklogged 
BEFORE INSERT ON logreg 
FOR EACH ROW  
BEGIN
    DECLARE x varchar(20);
    DECLARE y varchar(20);
    declare mess1 varchar(100);
    declare mess2 varchar(100);
    set mess1 = "ERROR: Logout before logging in again.";
    set mess2 = "ERROR: Invalid User.";
    set x =checkiflogged(new.customer_id); 
    set y =checkifexists(new.customer_id); 
    if(y='NO') THEN
        signal sqlstate '45000'
        set message_text=mess2;
    ELSE
        if(x='YES') THEN
            signal sqlstate '45000'
            set message_text = mess1;
        end if;
    end if;
END; 
$$
delimiter ;
---------------------------------------------------------------------------------
delimiter $$
CREATE OR REPLACE FUNCTION checkiflogged(cust_id int)
RETURNS varchar(20)
BEGIN 
    
    declare y varchar(15);
  
    declare there int;
    
    set there =0;
    
    select customer_id into there from logreg where customer_id=cust_id;
    -- select count(customer_id) into there from customer_details;
    if(there=0) THEN 
        set y='NO';
    ELSE
        set y='YES';
    end if;
    return y;
END; 
$$  
delimiter ;
--------------------------------------------------------------------------------------
delimiter $$
CREATE OR REPLACE FUNCTION checkifexists(cust_id int)
RETURNS varchar(20)
deterministic

BEGIN 
    
    declare present int;
    declare x varchar(255);
    set present =0;
    select customer_id into present from customer_details where customer_id=cust_id;
    if (present=0) THEN 
        set x="NO";
    ELSE
        set x="YES";
    end if;
    return x;
END; 
$$  
delimiter ;
----------------------------------------------------------------------------------------

delimiter $$
CREATE OR REPLACE TRIGGER validate 
BEFORE INSERT ON logreg 
FOR EACH ROW  
BEGIN
    declare startdate datetime;
    declare x varchar(20);
    declare msg varchar(255);
    declare plan int;
    declare daysleft int;
    set msg="Please renew your membership";
    select start_date into startdate from customer_details where customer_details.customer_id=new.customer_id;
    select customer_membershiplan into plan from customer_details where customer_details.customer_id=new.customer_id;

    if (plan = 1) THEN
        set daysleft=30;
    end if;  
    if (plan = 2) THEN
        set daysleft=120;
    end if;  
    if (plan = 3) THEN
        set daysleft=360;
    end if;  
    set x=checkdiff(startdate,daysleft);
    if (x="NO") THEN
        signal sqlstate '45000'
        set message_text=msg;
    end if;
END; 
$$
delimiter ;

----------------------------------------------------------------------------------

delimiter $$
CREATE OR REPLACE FUNCTION checkdiff(startdate datetime,daysleft int)
RETURNS varchar(20)
deterministic

BEGIN 
    declare x varchar(255);
    declare diff int;
    declare df datetime;
    set df=now();
    set diff=DATEDIFF(df,startdate);
    if (diff>daysleft) THEN 
        set x="NO";
    ELSE
        set x="YES";
    end if;
    return x;
END; 
$$  
delimiter ;