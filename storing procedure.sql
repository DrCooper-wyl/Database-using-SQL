##1. 创建和执行存储过程

#1) 使用SQL语句创建一个存储过程，要求根据男女生人数来输出不同的信息。如果男生人
#数大于女生人数，输出“男比女多”，否则输出“女比男多”，存储过程名称为 ShowPerson。
create procedure ShowPerson as
declare @男生人数 int,@女生人数 int
select @男生人数=count(*) from student where 性别='男'
select @女生人数=count(*) from student where 性别='女'
if @男生人数>@女生人数
print '男比女多'
else
print'女比男多'
exec ShowPerson;

#2) 查询某学生(根据学号查询)某学期选修课程的成绩，结果显示为学号、姓名、课程编
#号、成绩、学期，存储过程名为“查询成绩”。
delimiter $
CREATE PROCEDURE myproc()
COMMENT '查询成绩'
BEGIN
SELECT 学号,姓名,课程编号,成绩,学期 FROM student;
END $
delimiter ;

#3) 创建存储过程cjcx，根据输入的课程名称查询该课程的平均成绩、最高分和最低分。执
#行存储过程 cjcx，查询“管理学”课程的信息。
create cjcx(@课程名称 varchar(50)) as
select avg(成绩) 平均成绩,sum(成绩) 总成绩,max(成绩) 最高分,min(成绩) 最低分
from score inner join course on score.课程编号=course.课程编号 where 课程名称=@课程名称
exec cjcx @课程名称='管理学'

#4) 创建存储过程“查询学生信息”，如果给出姓名，则查询指定姓名的学生详细信息(包括学生信
#息和班级信息);如果不给出姓名，则查询所有学生的详细信息(包括学生信息和班级信息)。
delimiter $
create procedure 查询学生信息 (in nm char(10))
begin
if nm is null
then select * from student,class where student.班级编号=class.班级编号;
else select * from student,class where student.班级编号=class.班级编号 and student.姓名=nm;
end if;
end $;

#5) 创建存储过程“学生成绩综合查询”，参数为姓名、课程名称及学期，显示结果为学号、姓名、课程名称、成绩、学期。
delimiter $
CREATE PROCEDURE 学生成绩综合查询 (in nm char(10))
begin
SELECT student.姓名,课程名称,学期
from student,score,course
where student.学号=score.学号
and score.课程编号=course.课程编号;
end $

##2. 删除存储过程
#1) 删除存储过程“showperson”
drop procedure ShowPerson;

#2) 删除存储过程“根据班级名称查询学生信息”
drop procedure 根据班级名称查询学生信息;
