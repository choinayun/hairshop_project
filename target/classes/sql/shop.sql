CREATE TABLE shop
(
    s_name     VARCHAR2(40)    NOT NULL, 
    s_addr     VARCHAR2(200)    NOT NULL, 
    s_phone    VARCHAR2(20)    NOT NULL, 
    grade      NUMBER(5,1)     default(0), 
    s_num      NUMBER          NOT NULL, 
    id         VARCHAR2(20)    NOT NULL, 
    img1       VARCHAR2(100)    default('nan'), 
    img2       VARCHAR2(100)    default('nan'), 
    img3       VARCHAR2(100)    default('nan'), 
    img4       VARCHAR2(100)    default('nan'), 
    PRIMARY KEY (s_num)
);

ALTER TABLE shop
    ADD CONSTRAINT FK_shop_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE;

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('JR헤어', '서울 강남구 신사동 668', '02-0000-0000', 1, 'aaa', 'JR헤어1.jpg', 'JR헤어2.jpg', 'JR헤어3.jpg', 'JR헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3) 
values('가꿈헤어드림', '서울특별시 강남구 신사동 598-4', '02-0000-0001', 2, 'aaa', '가꿈헤어드림1.jpg', '가꿈헤어드림2.jpg', '가꿈헤어드림3.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('감동을더하다', '서울특별시 강남구 논현로 833', '02-0000-0002', 3, 'aaa', '감동을더하다1.jpg', '감동을더하다2.jpg', '감동을더하다3.jpg', '감동을더하다4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('김효리헤어', '서울특별시 강남구 압구정로30길 45', '02-0000-0003', 4, 'aaa', '김효리헤어1.jpg', '김효리헤어2.jpg', '김효리헤어3.jpg', '김효리헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('꾸밈헤어살롱', '서울특별시 강남구 논현로 857', '02-0000-0004', 5, 'aaa', '꾸밈헤어살롱1.jpg', '꾸밈헤어살롱2.jpg', '꾸밈헤어살롱3.jpg', '꾸밈헤어살롱4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('더순수헤어', '서울특별시 강남구 압구정로28길', '02-0000-0005', 6, 'aaa', '더순수헤어1.jpg', '더순수헤어2.jpg', '더순수헤어3.jpg', '더순수헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('두들헤어', '서울특별시 강남구 압구정로 168', '02-0000-0006', 7, 'aaa', '두들헤어1.jpg', '두들헤어2.jpg', '두들헤어3.jpg', '두들헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('듀벨헤어', '서울특별시 강남구 신사동 576-7번지', '02-0000-0007', 8, 'aaa', '듀벨헤어1.jpg', '듀벨헤어2.jpg', '듀벨헤어3.jpg', '듀벨헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('라라헤어', '서울특별시 강남구 신사동 581-3', '02-0000-0008', 9, 'aaa', '라라헤어1.jpg', '라라헤어2.jpg', '라라헤어3.jpg', '라라헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('라리엔', '서울특별시 강남구 논현로 857', '02-0000-0009', 10, 'aaa', '라리엔1.jpg', '라리엔2.jpg', '라리엔3.jpg', '라리엔4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3) 
values('르브헤어', '서울특별시 강남구 역삼동 815-2', '02-0000-0010', 11, 'aaa', '르브헤어1.jpg', '르브헤어2.jpg', '르브헤어3.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('리안헤어', '서울특별시 강남구 역삼동 816-1', '02-0000-0011', 12, 'aaa', '리안헤어1.jpg', '리안헤어2.jpg', '리안헤어3.jpg', '리안헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3) 
values('마지앤제롬', '서울특별시 서초구 강남대로 415', '02-0000-0012', 13, 'aaa', '마지앤제롬1.jpg', '마지앤제롬2.jpg', '마지앤제롬3.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('모리헤이즈', '서울특별시 강남구 역삼동 816-1', '02-0000-0013', 14, 'aaa', '모리헤이즈1.jpg', '모리헤이즈2.jpg', '모리헤이즈3.jpg', '모리헤이즈4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('살롱드라피네', '서울특별시 강남구 역삼동 619-28', '02-0000-0014', 15, 'aaa', '살롱드라피네1.jpg', '살롱드라피네2.jpg', '살롱드라피네3.jpg', '살롱드라피네4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('살롱드수풀림', '서울특별시 강남구 역삼1동 817-20', '02-0000-0015', 16, 'aaa', '살롱드수풀림1.jpg', '살롱드수풀림2.jpg', '살롱드수풀림3.jpg', '살롱드수풀림4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('살롱드에드가', '서울특별시 강남구 역삼동 816-1', '02-0000-0016', 17, 'aaa', '살롱드에드가1.jpg', '살롱드에드가2.jpg', '살롱드에드가3.jpg', '살롱드에드가4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('살롱존씨', '서울특별시 서초구 강남대로65길', '02-0000-0017', 18, 'aaa', '살롱존씨1.jpg', '살롱존씨2.jpg', '살롱존씨3.jpg', '살롱존씨4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3) 
values('아띠샵', '서울특별시 강남구 역삼동 816-7번지', '02-0000-0018', 19, 'aaa', '아띠샵1.jpg', '아띠샵2.jpg', '아띠샵3.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('앙비떼살롱', '서울특별시 서초구 강남대로 423', '02-0000-0019', 20, 'aaa', '앙비떼살롱1.jpg', '앙비떼살롱2.jpg', '앙비떼살롱3.jpg', '앙비떼살롱4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('온헤어', '서울특별시 동작구 사당동 272-38', '02-0000-0020', 21, 'aaa', '온헤어1.jpg', '온헤어2.jpg', '온헤어3.jpg', '온헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('유알헤어', '서울특별시 동작구 사당4동 272-28', '02-0000-0021', 22, 'aaa', '유알헤어1.jpg', '유알헤어2.jpg', '유알헤어3.jpg', '유알헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('이철헤어커커', '서울특별시 동작구 사당4동 278-53', '02-0000-0022', 23, 'aaa', '이철헤어커커1.jpg', '이철헤어커커2.jpg', '이철헤어커커3.jpg', '이철헤어커커4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('주니크살롱', '서울특별시 동작구 사당4동 268-20', '02-0000-0023', 24, 'aaa', '주니크살롱1.jpg', '주니크살롱2.jpg', '주니크살롱3.jpg', '주니크살롱4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('준오헤어', '서울특별시 동작구 사당4동 274-26', '02-0000-0024', 25, 'aaa', '준오헤어1.jpg', '준오헤어2.jpg', '준오헤어3.jpg', '준오헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('지구헤어', '서울특별시 동작구 사당4동 278-40', '02-0000-0025', 26, 'aaa', '지구헤어1.jpg', '지구헤어2.jpg', '지구헤어3.jpg', '지구헤어4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3) 
values('지노헤어', '서울특별시 동작구 사당4동 278-39', '02-0000-0026', 27, 'aaa', '지노헤어1.jpg', '지노헤어2.jpg', '지노헤어3.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('프랑크프로보', '서울특별시 동작구 사당4동 270-1', '02-0000-0027', 28, 'aaa', '프랑크프로보1.jpg', '프랑크프로보2.jpg', '프랑크프로보3.jpg', '프랑크프로보4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('헤어더뷰', '서울특별시 동작구 사당4동 272-12', '02-0000-0028', 29, 'aaa', '헤어더뷰1.jpg', '헤어더뷰2.jpg', '헤어더뷰3.jpg', '헤어더뷰4.jpg');

insert into shop(s_name, s_addr, s_phone, s_num, id, img1, img2, img3, img4) 
values('헤어위드동행', '서울특별시 동작구 사당로14길 38', '02-0000-0029', 30, 'aaa', '헤어위드동행1.jpg', '헤어위드동행2.jpg', '헤어위드동행3.jpg', '헤어위드동행4.jpg');