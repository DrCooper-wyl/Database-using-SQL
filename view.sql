#1.create view
#（1）
select *
from dbo.student
where (性别='男');

select *
from dbo.student
where (性别='女');

create view VBoy_Student
as
select *
from student
where 性别='男';

create view VGirl_Student
as
select *
from student
where 性别='女';

#(2)
create view Vgjmy081good_04010101(姓名,课程编号,成绩)
as
select 姓名,课程编号,成绩
from student join score on student.学号=score.学号
where 班级编号=081 and 课程编号=04010101 and 成绩>60;
#(3)
create view VS_AGE(姓名,年龄)
as
select 姓名,year(getdate())-year(出生日期)
from student;
#(4)
create view Vpjcj_Student(学号,平均成绩)
as
select 学号,avg(成绩)
from score
group by 学号;
#(5)
create view VCount_Xuanxiu(课程编号,选修人数)
as
select 课程编号,count(*)
from score
group by 课程编号;
#(6)
create view Vboygirlnumber(性别,人数)
as
select 性别,count(*)
from student join class on student.班级编号=class.班级编号
where student.班级编号=081
group by 性别;
#(7)
create view 分段统计(课程编号,良好以上,良好以下,合计)
as
select 课程编号,sum(case when 成绩>=80 then 1 else 0 end),sum(case when 成绩<80 then 1 else 0 end)
from score
group by 课程编号;
#2.inquire view
#(1)
select *
from VBoy_Student join VS_BT on VBoy_Student.姓名=VS_BT.姓名
where 年龄<21;
#(2)
select *
from VS_AGE
where 年龄<(select 年龄 from VS_AGE where 姓名='张楚');
#(3)
select 学号,平均成绩
from Vpjcj_Student
where 平均成绩<60;
#(4)
select 课程编号
from VCount_Xuanxiu
where 选修人数>=2;
#3.update view
#(1)
INSERT
INTO VBoy_Student
VALUES(学号='2021094020',姓名='赵新',性别='男',入学成绩=530,党员否=1,班级编号='202101');
#(2)
delete
from VBoy_Student
where 学号='2021094020';
#(3)
update Vpjcj_Student
set 平均成绩=80
where 学号='2021094001';
#4.delete view
#(1)
drop view VBoy_Student;
#(2)
drop view VS_AGE;
























































































































