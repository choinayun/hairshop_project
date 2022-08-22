CREATE TABLE member
(
    id       VARCHAR2(20)    NOT NULL, 
    pw       VARCHAR2(20)    NOT NULL, 
    name     VARCHAR2(20)    NOT NULL, 
    email    VARCHAR2(30)    NOT NULL, 
    phone    VARCHAR2(20)    NOT NULL, 
    addr     VARCHAR2(50)    NOT NULL, 
     PRIMARY KEY (id)
);
