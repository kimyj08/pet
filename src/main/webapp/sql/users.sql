CREATE table users(
	id				varchar2(20)	primary key,
	password		varchar2(20),
	name			varchar2(20),
	role			varchar2(5)
);

insert into users values('admin','admin','관리자','Admin');
insert into users values('hongkd','1234','홍길동','User');

ALTER TABLE userMember MODIFY um_no number(3) NOT NULL AUTO_INCREMENT;
ALTER TABLE userMember MODIFY um_no number(3) NOT NULL AUTO_INCREMENT;




	select
			 *
		FROM
			BUY 
			left join product
			on buy.p_pno = product.p_pno	
			where product.p_pno=1


			
				  	select * 
	  	from basket 
	  	left join product
	  	on basket.p_pno= product.p_pno
	  	where basket.um_no = 1



SELECT * FROM brandinfo
select * from basket;
delete  from basket ;
select * from usermember;
delete  from brandmember;
select * from brandinfo;
select * from brandmember;
drop table emp;
drop table bonus;
drop table brandmember;
drop table dept;
drop table salgrade;
ALTER TABLE buy add p_pno number(3);