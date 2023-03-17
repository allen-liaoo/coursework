-- init
create table contactMsg (
    title varchar(20) not null,
    email varchar(20) not null,
    username varchar(20) not null,
    link varchar(50),
    category varchar(8) not null,
    msg varchar(250) not null
);

-- insert record
insert into contactMsg values (...);

-- get record
select * from contactMsg where category='...';