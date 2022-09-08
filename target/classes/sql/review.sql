CREATE TABLE review
(
    r_date       DATE        default(sysdate), 
    content    VARCHAR2(100)   NOT NULL, 
    id         VARCHAR2(20)     NOT NULL, 
    num        NUMBER           NOT NULL, 
    s_num      NUMBER           NOT NULL, 
    img        VARCHAR2(100)    default('nan'), 
    grade      NUMBER           NOT NULL, 
    info       VARCHAR2(30)     NOT NULL, 
    PRIMARY KEY (num)
);

ALTER TABLE review
    ADD CONSTRAINT FK_review_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE;
<<<<<<< HEAD

ALTER TABLE review
    ADD CONSTRAINT FK_review_s_num_shop_s_num FOREIGN KEY (s_num)
        REFERENCES shop (s_num) ON DELETE CASCADE;
        
alter table review modify(img varchar2(100));
=======
        
ALTER TABLE review
    ADD CONSTRAINT FK_review_s_num_shop_s_num FOREIGN KEY (s_num)
        REFERENCES shop (s_num) ON DELETE CASCADE;
>>>>>>> 7620099b61309e720d32bf3bc84e926d7382e9fa
