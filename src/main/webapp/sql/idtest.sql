create table idtest(
    table_name varchar2(50) not null primary key,
    next_id number(30) not null
);

insert into idtest values('text',0);

commit;

create table board1(
    board_seq varchar2(40) not null primary key,
    board_title varchar2(40) not null,
    board_content varchar2(200) not null
);

commit;

select * from board1;
select * from board1 order by board_seq desc ;