-- 로그인 테이블
CREATE TABLE coffee_login(
id VARCHAR2(100) PRIMARY KEY,
pwd VARCHAR2(100) NOT NULL,
email VARCHAR2(100),
regdate DATE,
suspended NUMBER DEFAULT '0' CHECK(suspended IN('0','1')) -- 계정 정지 여부
);

-- 게시글 테이블
CREATE TABLE coffee_board(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,.
content CLOB,
viewCount NUMBER,
imgAddr VARCHAR2(200),
good NUMBER,      -- 추천수
regdate DATE
);

-- 글번호 시퀀스
CREATE SEQUENCE coffee_board_seq NOCACHE;

-- 댓글 테이블
CREATE TABLE coffee_board_comment(
num NUMBER PRIMARY KEY,   -- 덧글의 글 번호
writer VARCHAR2(100),
content VARCHAR2(500),
target_id VARCHAR2(100),   -- 덧글의 대상이 되는 아이디
ref_group NUMBER,   -- 덧글 그룹(원 글의 num과 같음)
comment_group NUMBER,   -- 덧글 내에서의 그룹
deleteContent NUMBER, -- 삭제된 글 정보
regdate DATE
);

-- 댓글 시퀀스
CREATE SEQUENCE coffee_comment_seq NOCACHE;