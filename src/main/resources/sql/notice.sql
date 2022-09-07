CREATE TABLE notice
(
    title      VARCHAR2(30)     NOT NULL, 
    content    VARCHAR2(300)    NOT NULL, 
    n_date     DATE            default(sysdate), 
    img        VARCHAR2(30)     default('nan'), 
    num        NUMBER           NOT NULL, 
    PRIMARY KEY (num)
);
alter table notice modify(img varchar2(100));
