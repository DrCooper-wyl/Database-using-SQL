Select * from student;

Select 课程名称,考核方式 from course;

Select distinct 学号 from score;

Select distinct 课程编号 from score;

Select 课程编号,课程名称 from course where 学时 between 40 and 60;

Select 学号,姓名 from student where 党员否=1;

Select 姓名,性别 from student where 姓名 like "张%";

Select 姓名,2012-year(出生日期) as 年龄 from student ORDER BY 2012-year(出生日期) asc;

Select top 20 percent 姓名 from student ORDER BY 入学成绩 desc;

Select top 3 with ties 姓名 from student ORDER BY 入学成绩 desc;

Select count(distinct 学号) as 学生人数 from student where datepart(m,出生日期)=10;

Select 课程名称 from course where 先修课 is null;

Select max(入学成绩) as 最高分, min(入学成绩) as 最低分 from student;

SELECT Cno,MAX(Grade),min(Grade) FROM SC GROUP BY Cno;

Select 性别, avg(入学成绩) as 平均成绩 from student group by 性别;

Select 考核方式 as 课程性质,sum(学分) as 总学分 from course group by 考核方式;

Select 学号 from score group by 学号 having count(*) >=2;

Select CURDATE();

Select * FROM Student ORDER BY rand(); 









