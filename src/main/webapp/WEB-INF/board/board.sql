show tables;

create table board(
	idx int not null auto_increment,      	/* 게시글의 고유번호 */
	nickName varchar(20) not null, 					/* 게시글 올린사람의 닉네임 */
	title varchar(100) not null,						/* 게시글의 글 제목	*/
	email varchar(50),											/* 올린이의 메일주소 */
	homePage varchar(50),										/* 올린이의 홈페이지주소	*/
	content text not null,									/* 글내용	*/
	wDate datetime not null default now(),	/* 글쓴 날짜 (현재)	*/
	readNum int default 0,									/* 글 조회수 */
	hostIp varchar(50) not null,						/* 접속 IP주소 */
	good int default 0,										/* 좋아요 */
	mid varchar(20) not null,								/* 회원 아이디(게시글 검색) */
	primary key(idx)												/* 기본키 : 글 고유번호 */
);
drop table board;
desc board;
select * from board;
alter table board change column goods good int default 0;
insert into board values (default,'관리맨','게시판 서비스를 시작합니다.','qkrtjdwo337@naver.com','sj__619','이곳은 게시판입니다.',default,default,'123.123.123.123',default,'admin');