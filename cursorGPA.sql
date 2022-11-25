delimiter $$
create function gpa(stu_id char(12))
    returns decimal(3, 2)
begin
    declare score, credit, GPA, total_credit, cumulative_GPA int default 0;
    declare done int default FALSE;
    declare cursor_choose_course cursor for
    select choose.score, course.credit from choose
    join course on choose.Course_id = course.Course_id
    where choose.Student_id = stu_id and choose.score IS NOT NULL;
declare continue handler for not found set done = TRUE;

open cursor_choose_course;
loop_cursor: loop
    fetch cursor_choose_course into score, credit;
    if done then leave loop_cursor;
    end if;
    set total_credit = total_credit + credit;
    if score >= 90 then set GPA = 4;
    elseif score >= 80 then set GPA = 3;
    elseif score >= 70 then set GPA = 2;
    elseif score >= 60 then set GPA = 1;
    else set GPA = 0;
    end if;
    set cumulative_GPA = cumulative_GPA + GPA * credit;
end loop;
close cursor_choose_course;
return if (total_credit > 0, cumulative_GPA/total_credit, 0);
end $$

delimiter ;