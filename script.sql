create database seg;
create user seg;
GRANT ALL PRIVILEGES ON seg.* TO 'seg'@'localhost';
CREATE TABLE `members` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uname` varchar(45) NOT NULL,
  `pass` int(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
