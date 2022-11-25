
CREATE TRIGGER student_length
on student 
for insert
as
declare @学号 char(10);

Insert into student values(20219000,'jack','F','2001-09-09',666,0,null,null,202190);

CREATE TRIGGER entry_score_min
on student after insert,update
as
if  (select entry_score from inserted) < 400
rollback;

insert student(id,name,sex,birth,entry_score,YN,class_no)values('2021094030','Sam','M','2004-1-1',389,0,'202101');


update student set entry_score=390 where name='Loisa';

CREATE TRIGGER trig_del
on student
after delete
as
if (select 党员否 from deleted) = 1
Rollback;

delete from student where name='Smith';

Create trigger trig_del_course
on course
For delete
As
If exists(select * from score where course_no=(select course_no from deleted))
begin
    delete from score where course_no=(select course_no from deleted)
end;







