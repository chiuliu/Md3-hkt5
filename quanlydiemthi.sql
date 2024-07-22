create database quanlydiemthi;
use quanlydiemthi;
-- Thiết kế CSDL
-- Tạo CSDL 

create table subject(
	subjectId VARCHAR(4) not null primary key,
    subjectName VARCHAR(45) not null,
    priority INT not null
);

create table student(
	studentId VARCHAR(4) not null primary key,
    studentName VARCHAR(100) not null,
    birthday DATE not null,
    gender BIT (1),
    address TEXT not null,
    phonenumber VARCHAR(45)
);

create table mark(
	subjectId VARCHAR(4),
    foreign key (subjectId) REFERENCES subject(subjectId),
    studentId VARCHAR(4),
    foreign key (studentId) references student(studentId),
    point DOUBLE
);

-- Thêm sửa xoá dữ liệu

-- Bảng student

insert into student(studentId, studentName, birthday, gender, address, phonenumber) values
  ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
  ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '9049828654'),
  ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
  ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '9836653353'),
  ('S005', 'Phạm Duy Nhật', '1998-10-04', 1, 'Tuyên Quang', '9872426678'),
  ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '9826542468'),
  ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '9823647453'),
  ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '9278674453'),
  ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '9892746673'),
  ('S010', 'Nguyễn Thiệu Quang', '2000-09-18', 1, 'Hà Nội', '9843788291');
  
  select studentId,studentName, birthday,   case gender when 1 then 'Nam'
  when 0 then 'Nữ' end as gender,address, phonenumber  
  from student s;
  
  -- Bảng subject
  
  INSERT INTO subject
VALUES
  ('MH01', 'Toán', 2),
  ('MH02', 'Vật Lý', 2),
  ('MH03', 'Hoá Học', 1),
  ('MH04', 'Ngữ Văn', 1),
  ('MH05', 'Tiếng Anh', 2);
  
  select * from subject;
  
  -- Bảng mark
  
  insert into mark values   ('MH01', 'S001', 8.5), ('MH02', 'S001', 7), ('MH03', 'S001', 9), ('MH04', 'S001', 9), ('MH05', 'S001', 5),
  ('MH01', 'S002', 9), ('MH02', 'S002', 8), ('MH03', 'S002', 6.5), ('MH04', 'S002', 8), ('MH05', 'S002', 6),
  ('MH01', 'S003', 7.5), ('MH02', 'S003', 6.5), ('MH03', 'S003', 8), ('MH04', 'S003', 7), ('MH05', 'S003', 7),
  ('MH01', 'S004', 6), ('MH02', 'S004', 7), ('MH03', 'S004', 5), ('MH04', 'S004', 6.5), ('MH05', 'S004', 8),
  ('MH01', 'S005', 5.5), ('MH02', 'S005', 8), ('MH03', 'S005', 7.5), ('MH04', 'S005', 8.5), ('MH05', 'S005', 9),
  ('MH01', 'S006', 8), ('MH02', 'S006', 10), ('MH03', 'S006', 9), ('MH04', 'S006', 7.5), ('MH05', 'S006', 6.5),
  ('MH01', 'S007', 9.5), ('MH02', 'S007', 9), ('MH03', 'S007', 6), ('MH04', 'S007', 9), ('MH05', 'S007', 4),
  ('MH01', 'S008', 10), ('MH02', 'S008', 8.5), ('MH03', 'S008', 8.5), ('MH04', 'S008', 6), ('MH05', 'S008', 9.5),
  ('MH01', 'S009', 7.5), ('MH02', 'S009', 7), ('MH03', 'S009', 9), ('MH04', 'S009', 5), ('MH05', 'S009', 10),
  ('MH01', 'S010', 6.5), ('MH02', 'S010', 8), ('MH03', 'S010', 5.5), ('MH04', 'S010', 4), ('MH05', 'S010', 7);
  
-- Cập nhật dữ liệu
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.

UPDATE student 
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';

-- SELECT * FROM student; 

-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
UPDATE subject set subjectname = 'Ngoại Ngữ',priority = 1 where subjectId = 'MH05';
select * from subject;

-- Cập nhật lại điểm của học sinh có mã `S009` thành
-- (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).

update mark set point = 8.5 where studentId = 'S009' and subjectId = 'MH01';
update mark set point = 7 where studentId = 'S009' and subjectId = 'MH02';
update mark set point = 5.5 where studentId = 'S009' and subjectId = 'MH03';
update mark set point = 6 where studentId = 'S009' and subjectId = 'MH04';
update mark set point = 9 where studentId = 'S009' and subjectId = 'MH05';

select * from mark;

-- Xoá dữ liệu
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK 
-- và thông tin học sinh này ở bảng STUDENT.

delete  from mark where studentId = 'S010';

-- B3. Truy vấn dữ liệu

-- Lấy ra tất cả thông tin của sinh viên trong bảng Student
select * from student;

-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
select subjectName as 'Tên môn học', subjectId as 'Mã môn học' from subject
    where priority = 1;
    
-- 3. Hiển thị thông tin học sinh bao gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh) ,
-- giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh
select studentId as 'Mã học sinh', studentName as 'Tên học sinh',
	year(curdate()) - year(birthday) as 'tuổi' ,
	case when gender = 1 then 'Nam' else 'Nữ' end as 'giới tính' ,
	address as 'quê quán' from student;
-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần   
 select s.studentName as 'Tên học sinh', su.subjectName as 'Tên môn học' ,p.point as 'Điểm thi'
    from mark p
    join student s on s.studentId = p.studentId
    join subject su on su.subjectId = p.subjectId
    where su.subjectName = 'Toán' order by p.point desc ;
    
-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
  select case when gender = 1 then 'Nam' else 'Nữ' end as 'Giới tính', count(*) as 'Số lượng'
  from student group by gender;
  
-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) ,
-- bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.

 select s.studentId as 'Mã học sinh', 
	s.studentName as 'Tên học sinh',
	sum(m.point) as 'Tổng Điểm',
	avg(m.point) as 'Điểm TB môn'
    from Mark m
	inner join student s on m.studentId = s.studentId
    group by s.studentId, s.studentName;
    
-- B4. Tạo View, Index, Procedure
-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán

 create view STUDENT_VIEW as
        select studentId as 'mã học sinh',studentName as 'tên học sinh',
               case when gender = 1 then 'Nam' else 'Nữ' end as 'giới tính' ,
               address as 'quê quán' from student;

-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học
create view AVERAGE_MARK_VIEW as
    select s.studentId as 'mã học sinh', s.studentName as 'tên học sinh',
       avg(m.point) as 'Điểm TB môn'
    from mark m
         inner join student s on m.studentId = s.studentId
    group by s.studentId, s.studentName;
 

	




  
  
  
  
