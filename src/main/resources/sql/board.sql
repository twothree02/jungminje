CREATE TABLE reply
(
    name           VARCHAR2(20)     , 
    write_group    NUMBER(10, 0)    , 
    write_date     DATE             DEFAULT sysdate , 
    content        VARCHAR2(300)    , 
    title          VARCHAR2(30)     , 
    step           NUMBER(38)       , 
    ident          NUMBER(38)       
);

CREATE TABLE notices_board
(
    write_no    NUMBER(10,0)     , 
    title       VARCHAR2(100)    , 
    content     VARCHAR2(300)    , 
    savedate    DATE             DEFAULT sysdate , 
    hit         NUMBER(10, 0)    DEFAULT 0 , 
    name        VARCHAR2(20)     
);

CREATE TABLE academic_board
(
    write_no    NUMBER(10,0)     , 
    title       VARCHAR2(100)    , 
    content     VARCHAR2(300)    , 
    savedate    DATE             DEFAULT sysdate , 
    hit         NUMBER(10, 0)    DEFAULT 0 , 
    name        VARCHAR2(20)     
);

CREATE TABLE portal_board
(
    write_no    NUMBER(10,0)     , 
    title       VARCHAR2(100)    , 
    content     VARCHAR2(300)    , 
    savedate    DATE             DEFAULT sysdate , 
    hit         NUMBER(10, 0)    DEFAULT 0 , 
    name        VARCHAR2(20)     
);