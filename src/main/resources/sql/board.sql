drop table if exists board_tbl;

create table board_tbl(
	bno int auto_increment primary key,
    title varchar(300) not null,
    content text not null,
    writer varchar(50) not null,
    regDate timestamp default current_timestamp,
    updateDate timestamp default current_timestamp
);

--insert into board_tbl(title, content, Writer) value ('게시물 제목입니다','배가 고픕니다','배고파');
--insert into board_tbl(title, content, Writer) value ('게시물 제목입니다2','배가 고픕니다2','배고파2');
--insert into board_tbl(title, content, Writer) value ('게시물 제목입니다3','배가 고픕니다3','배고파3');
--insert into board_tbl(title, content, Writer) value ('게시물 제목입니다4','배가 고픕니다4','배고파4');
--insert into board_tbl(title, content, Writer) value ('게시물 제목입니다5','배가 고픕니다5','배고파5');
--insert into board_tbl(title, content, Writer) value ('게시물 제목입니다6','배가 고픕니다6','배고파6');

insert into board_tbl(title, content, Writer) value ('게시물 제목입니다','집에가고싶습니다','집으로');
insert into board_tbl(title, content, Writer) value ('게시물 제목입니다2','집에가고싶습니다2','집으로2');
insert into board_tbl(title, content, Writer) value ('게시물 제목입니다3','집에가고싶습니다3','집으로3');
insert into board_tbl(title, content, Writer) value ('게시물 제목입니다4','집에가고싶습니다4','집으로4');
insert into board_tbl(title, content, Writer) value ('게시물 제목입니다5','집에가고싶습니다5','집으로5');
insert into board_tbl(title, content, Writer) value ('게시물 제목입니다6','집에가고싶습니다6','집으로6');