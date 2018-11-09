set names utf8;
set foreign_key_checks = 0;
drop database if exists imail;

create database if not exists imail;
use imail;

drop table if exists mail;

create table mail(
	id int not null primary key auto_increment,
	`from` varchar(255),
	fromName varchar(255),
	`to` varchar(255),
	toName varchar(255),
	sendDate datetime,
	title varchar(255),
	text varchar(255),
	star boolean,
	`read` boolean,
	`delete` boolean
);

drop table if exists account;

create table account(
	id varchar(255) not null primary key,
	password varchar(255) not null,
	firstName varchar(255) not null,
	lastName varchar(255) not null,
	phoneNumber varchar(255),
	birthDay datetime,
	gender varchar(10)
);

insert into mail values(
	1,
	"personA@imail.com",
	"personA",
	"personB@imail.com",
	"personB",
	null,
	"test",
	"testText",
	false,
	false
);