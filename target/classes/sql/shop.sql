CREATE TABLE shop
(
    s_name     VARCHAR2(40)    NOT NULL, 
    s_addr     VARCHAR2(50)    NOT NULL, 
    s_phone    VARCHAR2(20)    NOT NULL, 
    grade      NUMBER(1,1)     default(0), 
    s_num      NUMBER          NOT NULL, 
    id         VARCHAR2(20)    NOT NULL, 
    img1       VARCHAR2(30)    default('nan'), 
    img2       VARCHAR2(30)    default('nan'), 
    img3       VARCHAR2(30)    default('nan'), 
    img4       VARCHAR2(30)    default('nan'), 
    PRIMARY KEY (s_num)
);

ALTER TABLE shop
    ADD CONSTRAINT FK_shop_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE;
        
alter table shop modify(img1 varchar2(100));
alter table shop modify(img2 varchar2(100));
alter table shop modify(img3 varchar2(100));
alter table shop modify(img4 varchar2(100));