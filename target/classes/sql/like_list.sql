CREATE TABLE like_list
(
    s_num    NUMBER         NOT NULL, 
    id       VARCHAR2(20)    NOT NULL
);

ALTER TABLE like_list
    ADD CONSTRAINT FK_like_list_id_member_id FOREIGN KEY (id)
        REFERENCES member (id) ON DELETE CASCADE;
