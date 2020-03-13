-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- member Table Create SQL
CREATE TABLE member
(
    `mb_uid`        INT             NOT NULL    AUTO_INCREMENT COMMENT '맴버uid', 
    `mb_id`         VARCHAR(45)     NOT NULL    COMMENT '맴버id', 
    `mb_pw`         VARCHAR(45)     NOT NULL    COMMENT '맴버pw', 
    `mb_nn`         VARCHAR(45)     NOT NULL    COMMENT '맴버nick', 
    `mb_phone`      VARCHAR(45)     NOT NULL    COMMENT '맴버연락처', 
    `mb_email`      VARCHAR(100)    NOT NULL    COMMENT '맴버email', 
    `mb_emailhash`  VARCHAR(100)    NULL        COMMENT '암호화', 
    `mb_emailsign`  INT             NOT NULL    DEFAULT 0, 
    `mb_zipcode`    VARCHAR(45)     NOT NULL    COMMENT '우편번호', 
    `mb_addr`       VARCHAR(100)    NOT NULL    COMMENT '맴버주소', 
    `mb_addr2`      VARCHAR(100)    NULL        COMMENT '맴버상세주소', 
    `mb_regdate`    DATETIME        NOT NULL    DEFAULT now() COMMENT '등록일', 
    `mb_level`      INT             NOT NULL    DEFAULT 1 COMMENT '권한', 
    PRIMARY KEY (mb_uid)
);

ALTER TABLE member COMMENT '회원테이블';

ALTER TABLE member
    ADD CONSTRAINT UC_mb_id UNIQUE (mb_id);

ALTER TABLE member
    ADD CONSTRAINT UC_mb_nn UNIQUE (mb_nn);

ALTER TABLE member
    ADD CONSTRAINT UC_mb_email UNIQUE (mb_email);


-- member Table Create SQL
CREATE TABLE goods
(
    `g_uid`      INT            NOT NULL    AUTO_INCREMENT COMMENT '가구uid', 
    `g_type`     INT            NOT NULL    COMMENT '가구type', 
    `g_name`     VARCHAR(45)    NOT NULL    COMMENT '가구이름', 
    `g_img`      VARCHAR(45)    NOT NULL    COMMENT '대표이미지', 
    `g_size`     VARCHAR(45)    NULL        COMMENT '가구크기', 
    `g_price`    INT            NOT NULL    COMMENT '가구가격', 
    `g_likecnt`  INT            NOT NULL    DEFAULT 0 COMMENT '좋아요개수', 
    PRIMARY KEY (g_uid)
);

ALTER TABLE goods COMMENT '가구테이블';


-- member Table Create SQL
CREATE TABLE goods_info
(
    `in_uid`    INT            NOT NULL    AUTO_INCREMENT COMMENT '가구상세uid', 
    `g_uid`     INT            NOT NULL    COMMENT '가구uid', 
    `in_color`  VARCHAR(45)    NOT NULL    COMMENT '색상', 
    `in_img`    VARCHAR(45)    NULL        COMMENT '이미지', 
    `in_inv`    INT            NOT NULL    DEFAULT 0 COMMENT '재고', 
    PRIMARY KEY (in_uid)
);

ALTER TABLE goods_info COMMENT '가구상세';

ALTER TABLE goods_info
    ADD CONSTRAINT FK_goods_info_g_uid_goods_g_uid FOREIGN KEY (g_uid)
        REFERENCES goods (g_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE comment
(
    `co_uid`      INT            NOT NULL    AUTO_INCREMENT COMMENT '리뷰uid', 
    `mb_uid`      INT            NOT NULL    COMMENT '회원uid', 
    `g_uid`       INT            NOT NULL    COMMENT '가구uid', 
    `co_subject`  VARCHAR(45)    NOT NULL    COMMENT '리뷰제목', 
    `co_content`  TEXT           NOT NULL    COMMENT '리뷰내용', 
    `co_regdate`  DATETIME       NOT NULL    DEFAULT now() COMMENT '등록일', 
    PRIMARY KEY (co_uid)
);

ALTER TABLE comment COMMENT '한줄평';

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_g_uid_goods_g_uid FOREIGN KEY (g_uid)
        REFERENCES goods (g_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE comment
    ADD CONSTRAINT FK_comment_mb_uid_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE series
(
    `sr_uid`      INT            NOT NULL    AUTO_INCREMENT COMMENT '시리즈uid', 
    `sr_subject`  INT            NOT NULL    COMMENT '시리즈제목', 
    `sr_img`      VARCHAR(45)    NOT NULL    COMMENT '시리즈이미지', 
    PRIMARY KEY (sr_uid)
);

ALTER TABLE series COMMENT '시리즈';


-- member Table Create SQL
CREATE TABLE g_like
(
    `gl_uid`      INT         NOT NULL    AUTO_INCREMENT COMMENT '가구좋아요uid', 
    `mb_uid`      INT         NOT NULL    COMMENT '맴버uid', 
    `g_uid`       INT         NOT NULL    COMMENT '가구uid', 
    `gl_regdate`  DATETIME    NOT NULL    DEFAULT now() COMMENT '등록일', 
    PRIMARY KEY (gl_uid)
);

ALTER TABLE g_like COMMENT '가구좋아요';

ALTER TABLE g_like
    ADD CONSTRAINT FK_g_like_g_uid_goods_g_uid FOREIGN KEY (g_uid)
        REFERENCES goods (g_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE g_like
    ADD CONSTRAINT FK_g_like_mb_uid_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE cart
(
    `cr_uid`      INT         NOT NULL    AUTO_INCREMENT COMMENT '장바구니uid', 
    `mb_uid`      INT         NOT NULL    COMMENT '맴버uid', 
    `in_uid`      INT         NOT NULL    COMMENT '가구상세uid', 
    `cr_amount`   INT         NOT NULL    COMMENT '수량', 
    `cr_regdate`  DATETIME    NOT NULL    DEFAULT now() COMMENT '등록일', 
    PRIMARY KEY (cr_uid)
);

ALTER TABLE cart COMMENT '장바구니';

ALTER TABLE cart
    ADD CONSTRAINT FK_cart_mb_uid_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE cart
    ADD CONSTRAINT FK_cart_in_uid_goods_info_in_uid FOREIGN KEY (in_uid)
        REFERENCES goods_info (in_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE payment
(
    `py_uid`      INT             NOT NULL    AUTO_INCREMENT COMMENT '구매uid', 
    `mb_uid`      INT             NOT NULL    COMMENT '맴버uid', 
    `in_uid`      INT             NOT NULL    COMMENT '가구상세uid', 
    `py_amount`   INT             NOT NULL    COMMENT '구매수량', 
    `py_confirm`  INT             NOT NULL    DEFAULT 0 COMMENT '구매확정', 
    `py_regdate`  DATETIME        NOT NULL    DEFAULT now() COMMENT '구매일', 
    `py_zipcode`  VARCHAR(45)     NULL        COMMENT '우편번호', 
    `py_addr`     VARCHAR(100)    NULL        COMMENT '받을주소', 
    `py_addr2`    VARCHAR(100)    NULL        COMMENT '받을주소상세', 
    PRIMARY KEY (py_uid)
);

ALTER TABLE payment COMMENT '구매목록';

ALTER TABLE payment
    ADD CONSTRAINT FK_payment_mb_uid_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE payment
    ADD CONSTRAINT FK_payment_in_uid_goods_info_in_uid FOREIGN KEY (in_uid)
        REFERENCES goods_info (in_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE co_report
(
    `re_uid`      INT         NOT NULL    AUTO_INCREMENT COMMENT '리뷰신고uid', 
    `co_uid`      INT         NOT NULL    COMMENT '리뷰uid', 
    `mb_uid`      INT         NOT NULL    COMMENT '맴버uid', 
    `re_regdate`  DATETIME    NOT NULL    DEFAULT now() COMMENT '신고일', 
    `re_type`     INT         NOT NULL    COMMENT '신고사유', 
    `re_content`  TEXT        NULL        COMMENT '신고상세내용', 
    PRIMARY KEY (re_uid)
);

ALTER TABLE co_report COMMENT '한줄평신고';

ALTER TABLE co_report
    ADD CONSTRAINT FK_co_report_co_uid_comment_co_uid FOREIGN KEY (co_uid)
        REFERENCES comment (co_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE co_report
    ADD CONSTRAINT FK_co_report_mb_uid_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE series_goods
(
    `srg_uid`  INT    NOT NULL    AUTO_INCREMENT COMMENT '시리즈대상uid', 
    `g_uid`    INT    NOT NULL    COMMENT '가구uid', 
    `sr_uid`   INT    NOT NULL    COMMENT '시리즈uid', 
    PRIMARY KEY (srg_uid)
);

ALTER TABLE series_goods COMMENT '시리즈대상';

ALTER TABLE series_goods
    ADD CONSTRAINT FK_series_goods_g_uid_goods_g_uid FOREIGN KEY (g_uid)
        REFERENCES goods (g_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE series_goods
    ADD CONSTRAINT FK_series_goods_sr_uid_series_sr_uid FOREIGN KEY (sr_uid)
        REFERENCES series (sr_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- member Table Create SQL
CREATE TABLE request
(
    `rq_uid`       INT            NOT NULL    AUTO_INCREMENT COMMENT '문의uid', 
    `mb_uid`       INT            NOT NULL    COMMENT '맴버uid', 
    `rq_type`      VARCHAR(45)    NOT NULL    COMMENT '문의분류', 
    `rq_subject`   VARCHAR(45)    NOT NULL    COMMENT '문의제목', 
    `rq_content`   TEXT           NOT NULL    COMMENT '문의내용', 
    `rq_response`  TEXT           NULL        COMMENT '문의답변', 
    `rq_regdate`   DATETIME       NOT NULL    DEFAULT now() COMMENT '등록일', 
    PRIMARY KEY (rq_uid)
);

ALTER TABLE request
    ADD CONSTRAINT FK_request_mb_uid_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


/* Drop Tables */

DROP TABLE IF EXISTS test_write;


CREATE TABLE test_write
(
	wr_uid int NOT NULL AUTO_INCREMENT,
	wr_subject varchar(200) NOT NULL,
	wr_content text,
	wr_name varchar(20) NOT NULL,
	wr_viewcnt int DEFAULT 0,
	wr_regdate datetime DEFAULT now(),
	PRIMARY KEY (wr_uid)
);

-- 기본데이터 삽입
INSERT INTO test_write
	(wr_subject, wr_content, wr_name)
VALUES
	('첫째글:방가요', '안녕하세요', '김희철'),
	('둘째글:헤헤헤','1111', '김수길'),
	('세째글:힘내세요', '7394', '최진덕'),
	('네째글: ... ', '9090', '이혜원'),
	('다섯째글: 게시판', '7531', '박수찬')
;

/* Drop Tables */

DROP TABLE IF EXISTS test_card;
DROP TABLE IF EXISTS test_ticket;


/* Create Tables */

CREATE TABLE test_card
(
	user_id varchar(20) NOT NULL,
	buy_amount int
);


CREATE TABLE test_ticket
(
	user_id varchar(20) NOT NULL,
	ticket_count int NOT NULL,
	CONSTRAINT ticket_buy_limit
	CHECK (ticket_count BETWEEN 1 AND 5)
);

select wr_viewcnt from test_write;