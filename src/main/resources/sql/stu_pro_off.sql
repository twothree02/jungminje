CREATE TABLE register_info
(
    major_semester    VARCHAR2(50)    , 
    id_num            VARCHAR2(50)    , 
    name              VARCHAR2(20)    , 
    scholarship       NUMBER(38)     DEFAULT 0 , 
    total_score       NUMBER(10)      , 
    rank              NUMBER(10)      , 
    year              VARCHAR2(20)    
);

CREATE TABLE tuition
(
    grade_101            VARCHAR2(20)    DEFAULT 'N' , 
    grade_102            VARCHAR2(20)    DEFAULT 'N' , 
    grade_201            VARCHAR2(20)    DEFAULT 'N' , 
    grade_202            VARCHAR2(20)    DEFAULT 'N' , 
    payment_stu    VARCHAR2(20)    DEFAULT 'N' , 
    payment        VARCHAR2(20)    DEFAULT 'N' , 
    id_num         VARCHAR2(50)    , 
    name          VARCHAR2(20)    , 
    reg_start          DATE            , 
    reg_end           DATE            
);

CREATE TABLE grade_info
(
    id_num              VARCHAR2(50)    , 
    name                VARCHAR2(20)    , 
    major_semester      VARCHAR2(50)    , 
    subject_name        VARCHAR2(20)    , 
    grade               VARCHAR2(10)    , 
    score               NUMBER(20)      , 
    prof_name           VARCHAR2(20)    , 
    received_cred       NUMBER(20)      , 
    Application_cred    NUMBER(20)      
);

CREATE TABLE subject_all
(
    major_semester    VARCHAR2(50)    , 
    subject_name      VARCHAR2(20)    , 
    prof_name         VARCHAR2(20)    , 
    classroom         VARCHAR2(50)    , 
    lecture_time      VARCHAR2(50)    , 
    year              VARCHAR2(20)    
);