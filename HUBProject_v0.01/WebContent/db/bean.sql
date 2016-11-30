insert into USER_TB values('admin', 'admin', null, null, null, 'Y');
insert into USER_TB values('hub', 'hub', 'hub@hub.com', 'default.png', '안녕하세요 HUB입니다.', 'N');
insert into USER_TB values('111', '1', '111@hub.com', 'default.png', '안녕하세요 111입니다.', 'N');
insert into USER_TB values('222', '2', '222@hub.com', 'default.png', '안녕하세요 222입니다.', 'N');
insert into USER_TB values('333', '3', '333@hub.com', 'default.png', '안녕하세요 333입니다.', 'N');
insert into USER_TB values('444', '5', '444@hub.com', 'default.png', '안녕하세요 444입니다.', 'N');
insert into USER_TB values('555', '5', '555@hub.com', 'default.png', '안녕하세요 555입니다.', 'N');
insert into USER_TB values('666', '6', '666@hub.com', 'default.png', '안녕하세요 666입니다.', 'N');

insert into Userconn_TB values('hub', '운동');
insert into Userconn_TB values('111', '여행');
insert into Userconn_TB values('222', '사진');
insert into Userconn_TB values('333', '컴퓨터');
insert into Userconn_TB values('444', '게임');
insert into Userconn_TB values('555', '자바');
insert into Userconn_TB values('666', '음악');


insert into Bucketlist_tb values(bucketlist_seq.nextVal, '세계일주 하기', '죽기전에', 2, '꼭 가야지', '돈이 없음', 'N', 'hub');
insert into Bucketlist_tb values(bucketlist_seq.nextVal, '호날두 따라잡기', '내일까지', 5, '가능할까?', '축구화가 없음', 'N', '111');
insert into Bucketlist_tb values(bucketlist_seq.nextVal, '효도르처럼 되기', '모레까지', 2, '가능할까?', '축구화가 없음', 'N', '222');
insert into Bucketlist_tb values(bucketlist_seq.nextVal, '사진잘찍기', '2월까지', 1, '1. 카메라 사기 2. 돈모으기', '없음', 'N', '333');
insert into Bucketlist_tb values(bucketlist_seq.nextVal, '버스킹 하기', '새해첫날', 3, '기타 사기, 노래잘하기', '스피커가 없어요', 'N', '444');
insert into Bucketlist_tb values(bucketlist_seq.nextVal, '다이아 찍기', '올말까지', 4, '2016.10.22 브론즈5', '마우스가 없음', 'N', '555');
insert into Bucketlist_tb values(bucketlist_seq.nextVal, '포토샾 고수', '내일까지', 6, '툴, 단축키, 효과', '수업좀 해주세요', 'N', '666');

insert into bucketconn_tb values(1, '여행');
insert into bucketconn_tb values(2, '운동');
insert into bucketconn_tb values(3, '운동');
insert into bucketconn_tb values(4, '사진');
insert into bucketconn_tb values(5, '음악');
insert into bucketconn_tb values(6, '게임');
insert into bucketconn_tb values(7, '사진');

insert into connchain_tb values('여행');
insert into connchain_tb values('운동');
insert into connchain_tb values('사진');
insert into connchain_tb values('컴퓨터');
insert into connchain_tb values('게임');
insert into connchain_tb values('자바');
insert into connchain_tb values('음악');

COMMIT;