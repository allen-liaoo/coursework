-- colors table. I've created this for you this time.
create table colors (
    name varchar(255) not null,
    color_code text not null,
    primary key(name)
);

-- I recommend testing and documenting commands for getting all colors and for adding a color.

-- get colors
select * from colors;

-- add a color
insert into colors values (name, color_code);