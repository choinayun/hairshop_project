CREATE TABLE notice
(
    title      VARCHAR2(30)     NOT NULL, 
    content    VARCHAR2(300)    NOT NULL, 
    n_date     DATE            default(sysdate), 
    img        VARCHAR2(100)     default('nan'), 
    num        NUMBER           NOT NULL, 
    PRIMARY KEY (num)
);

