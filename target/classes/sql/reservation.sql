CREATE TABLE reservation
(
    id        VARCHAR2(20)    NOT NULL, 
    name      VARCHAR2(20)    NOT NULL, 
    status    NUMBER          default(0), 
    info      VARCHAR2(30)    NOT NULL, 
    r_date    VARCHAR2(20)    NOT NULL, 
    r_time	  varchar2(20)    NOT NULL,    
    price     VARCHAR2(20)    NOT NULL, 
    s_shop    NUMBER          NOT NULL, 
    num       NUMBER          NOT NULL, 
    PRIMARY KEY (num)
);

ALTER TABLE reservation
    ADD CONSTRAINT FK_reservation_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE;""
        
ALTER TABLE reservation
    ADD CONSTRAINT FK_reser_s_num_shop_s_num FOREIGN KEY (s_shop)
        REFERENCES shop (s_num) ON DELETE CASCADE;
