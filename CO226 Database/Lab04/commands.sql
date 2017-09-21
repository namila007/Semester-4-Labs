Task 01;

Create database E14084Lab04;

use E14084Lab04;

#creating table movie
create table movie (
    -> id int not null,
    -> title varchar(100),
    -> year smallint,
    -> director varchar(100));

 alter table movie add primary key (id);

#creating table reviewer
 create table reviewer(
    -> id int not null,
    -> name varchar(100),
    -> primary key(id));

#creating table rating
 create table rating(
    -> reviewerid int not null,
    -> movieid int not null,
    -> stars tinyint,
    -> date datetime);
alter table rating
    -> add foreign key(reviewerid) references reviewer(id);
alter table rating
    -> add foreign key(movieid) references movie(id);


#addinig values to movie
 insert into movie values(102,'star wars',1977,'george lucas');
  insert into movie values(103,'the sound of music',1965,'robert wise');
   insert into movie values(103,'the sound of music',1965,'robert wise');
  insert into movie values(104,'E.T',1982,'steven spielberg');
insert into movie values(105,'titanic',1997,'james cameron');
  insert into movie values(106,'snow white',1937,NULL);
 insert into movie values(107,'avatar',2009,'james cameron');
 insert into movie values(108,'raiders of the lost ark',1981,'steven spilberg');	 	


#adding values to reviewer
 insert into reviewer values(201,'sarah martinez');
 insert into reviewer values(202,'daniel lewis');
 insert into reviewer values(203,'brittany harris');
  insert into reviewer values(204,'mike anderson');
  insert into reviewer values(205,'chris jackson');
 insert into reviewer values(206,'elizabeth thomas');
  insert into reviewer values(207,'james cameron');
  insert into reviewer values(208,'ashley white');

#adding values to ratings
INSERT INTO `rating` (`reviewerid`, `movieid`, `stars`, `date`) VALUES ('201', '101', '2', '2011-01-22');
INSERT INTO `rating` (`reviewerid`, `movieid`, `stars`, `date`) VALUES ('201', '101', '4', '2011-01-27'), 
			('202', '106', '4', NULL), ('203', '103', '2', '2011-01-20'), 
			('203', '108', '4', '2011-01-12'), ('203', '108', '2', '2011-01-30'), 
			('204', '101', '3', '2011-01-09'), ('205', '103', '3', '2011-01-27'),
			 ('205', '104', '2', '2011-01-22'), ('205', '108', '4', NULL),
			  ('206', '107', '3', '2011-01-15'), ('206', '106', '5', '2011-01-19'),
			   ('207', '107', '5', '2011-01-20'), ('208', '104', '3', '2011-01-02');
