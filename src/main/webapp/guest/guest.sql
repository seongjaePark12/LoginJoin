/* guest.sql(방명록)*/
create table guest(
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	email varchar(60),
	homepage varchar(60),
	vDate datetime default now(),
	hostIp varchar(50) not null,
	content text not null
);

desc guest;
/* drop table guest; */

insert into guest values(default,'관리자','qkrtjdwo337@naver.com','instagram/sj__619',default,'192.168.0.9','방명록 서비스를 시작합니다');
insert into guest values(default,'홍길동','hdk1234@naver.com','',default,'192.168.0.10','잠시 방문함');

select * from guest;
