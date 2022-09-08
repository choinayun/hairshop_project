CREATE TABLE QnA
(
    id         VARCHAR2(20)     NOT NULL, 
    title      VARCHAR2(30)     NOT NULL, 
    content    VARCHAR2(300)    NOT NULL, 
    img        VARCHAR2(100)    default('nan'), 
    q_date       DATE                default(sysdate), 
    num        NUMBER           NOT NULL, 
     PRIMARY KEY (num)
);

ALTER TABLE QnA
    ADD CONSTRAINT FK_QnA_id_member_id FOREIGN KEY (id)
<<<<<<< HEAD
        REFERENCES member (id) ON DELETE CASCADE;

alter table qna modify(img varchar2(100));
=======
        REFERENCES member (id) ON DELETE CASCADE;
>>>>>>> 7620099b61309e720d32bf3bc84e926d7382e9fa
