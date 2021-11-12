show tables;

CREATE TABLE user (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20
);

INSERT INTO user VALUES(default,'관리자',24);
INSERT INTO user VALUES(default,'홍길동',25);
INSERT INTO user VALUES(default,'김말숙',default);
INSERT INTO user VALUES(default,'관리맨',49);
INSERT INTO user VALUES(default,'홍길자',35);
INSERT INTO user VALUES(default,'김영숙',default);
INSERT INTO user VALUES(default,'관용맨',59);
INSERT INTO user VALUES(default,'홍말자',55);
INSERT INTO user VALUES(default,'김미소',default);

drop table user;

select * from user;