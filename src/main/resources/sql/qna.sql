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
        REFERENCES member (id) ON DELETE CASCADE;

create SEQUENCE qna_SEQ
START WITH 1 
INCREMENT BY 1; 