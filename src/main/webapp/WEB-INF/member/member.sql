show tables;

create table member(
	idx int not null auto_increment,
	mid varchar(20) not null,
	pwd varchar(50) not null,				/* 입력시 9자로 제하처리할것*/
	pwdKey int not null, 						/* 해시키 관리하는 키번호 */
	nickName varchar(20) not null,	/* 별명(중복불허)	 */
	name varchar(20) not null,
	gender varchar(10) default '남자',
	birthday datetime default now(),
	tel varchar(15),
	address varchar(50),
	email varchar(50) not null,
	homePage varchar(50),
	job varchar(20),
	hobby varchar(60),
	photo varchar(100) default 'noimage.jpg',	/* 회원 프로필사진 */
	content text,															/* 자기소개	*/
	userInfor char(6) default '공개',
	userDel char(2) default 'NO',		/* 회원 탈퇴 신청 여주(OK:탈퇴신청한회원, NO: 현재가입중인회원)	*/
	point int default 100,					/* 포인트(최초가입회원은 100, 한번 방문시마다 10)	*/
	level	int default 1,						/* 1:준회원, 2:정회원, 3:우수회원, 4:운영자, 0:관리자	*/
	visitCnt int default 0,					/* 방문횟수 */
	startDate datetime default now(),	/* 최초 가입일 */
	lastDate datetime default now(),	/* 마지막 접속일 */
	primary key(idx, mid)							/* 기본키 : 고유번호,아이디	*/
);

desc member;

insert into member values(default,'admin','1234',1,'관리맨','관리자',default,default,010-1004-1004,'경기도 수원시',
'admin1234@naver.com','blog.daum.net/1234','프리랜서','등산/바둑',
default,'관리자입니다',default,default,default,default,default,default,default);

update member set level = 0 where mid = 'admin';
delete from member where mid='hkd1234';

select * from member;

/* 해시테이블 (비밀번호 키/값) */
create table hashTable(
	pwdKey int not null,						/* 비밀번호 키 */
	pwdValue varchar(30) not null		/* 비밀번호 값	*/
);

insert into hashTable values (0,'12123434');
insert into hashTable values (1,'25234534');
insert into hashTable values (2,'36345656');
insert into hashTable values (3,'67456786');
insert into hashTable values (4,'78567825');
insert into hashTable values (5,'69678976');
insert into hashTable values (6,'70789089');
insert into hashTable values (7,'12121245');
insert into hashTable values (8,'23232345');
insert into hashTable values (9,'34443414');
insert into hashTable values (10,'45454515');
insert into hashTable values (11,'56565686');
insert into hashTable values (12,'67676778');
insert into hashTable values (13,'78787864');
insert into hashTable values (14,'89898964');
insert into hashTable values (15,'90009075');
insert into hashTable values (16,'21212178');
insert into hashTable values (17,'32323289');
insert into hashTable values (18,'43434345');
insert into hashTable values (19,'55545476');