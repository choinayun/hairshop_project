CREATE TABLE menu
(
    info        VARCHAR2(30)    NOT NULL, 
    price       VARCHAR2(20)    NOT NULL, 
    category    NUMBER          NOT NULL
);

insert into menu values( '남성컷', '18,000', 0 ); 
insert into menu values( '여성컷', '20,000', 0 ); 
insert into menu values( '디자인컷', '30,000', 0 ); 
insert into menu values( '앞머리컷', '10,000', 0 ); 

insert into menu values( '셋팅펌', '44,000', 1 ); 
insert into menu values( '매직', '55,000', 1 ); 
insert into menu values( '볼륨매직', '66,000', 1 ); 
insert into menu values( '뿌리매직', '66,000', 1 ); 
insert into menu values( '복구펌', '100,000', 1 ); 
insert into menu values( '다운펌', '20,000', 1 ); 
insert into menu values( '뿌리볼륨', '80,000', 1 ); 

insert into menu values( '뿌리염색', '80,000', 2 ); 
insert into menu values( '전체탈색', '100,000', 2 ); 
insert into menu values( '디자인염색', '200,000', 2 ); 
insert into menu values( '전체염색', '110,000', 2 ); 

insert into menu values( '기본클리닉', '50,000', 3 ); 
insert into menu values( '두피케어', '60,000', 3 ); 
insert into menu values( '복구클리닉', '200,000', 3 ); 
insert into menu values( '모발클리닉', '40,000', 3 );
insert into menu values( '큐티클 보호 영양제', '40,000', 3 ); 

insert into menu values( '드라이 + 샴푸', '50,000', 4 ); 
insert into menu values( '드라이', '35,000', 4 );  
