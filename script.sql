create database seg;
create user seg;
GRANT ALL PRIVILEGES ON seg.* TO 'seg'@'localhost';
CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into `members` (uname,pass) values ('Michel','123456');
select * from members where uname='Michel' and pass='123456'