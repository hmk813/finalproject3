--직원 테이블 생성
CREATE TABLE staff (
	staff_id	varchar2(30) PRIMARY KEY,
    staff_department_no number references department(department_no) on delete set null,
	staff_birth	date not NULL,
	staff_phone	char(13) not NULL,
	staff_address	varchar2(100)	NULL,
	staff_enroll_date	date	not NULL,
	staff_leave_date	date	NULL,
	staff_state	char(1) DEFAULT 'y'	CHECK (staff_state in('y','f')) not null,
	staff_pw	varchar2(20)	not NULL,
	staff_grade	varchar2(9) default '일반' check(staff_grade in('관리자','팀장','과장','부장','사원')) NULL,
	staff_name varchar2(12)	NULL,
	staff_leave_cnt number(2) DEFAULT 0,
    staff_dayoff number(2) DEFAULT 0
);

--부서 테이블 생성
create table department(
department_no number primary key,
department_name varchar2(10) not null
);

--부서 번호 시퀀스 생성
create sequence department_seq;

--첨부파일 테이블 생성
create table attachment(
attachment_no number primary key,
attachment_name varchar2(256) not null,
attachment_type varchar2(30) not null,
attachment_size number not null check(attachment_size >= 0),
attachment_date date default sysdate not null
);

--첨부파일 시퀀스 번호 생성
create sequence attachment_seq;

--직원 테이블 생성
CREATE TABLE staff_img(
img_attach_no references attachment(attachment_no) on delete cascade,
img_staff_id references staff(staff_id) on delete cascade
);

--휴가 테이블 생성
CREATE TABLE vacation (
vacation_no	number	PRIMARY KEY,
vacation_staff_id	references staff(staff_id) on delete set null,
vacation_type	varchar(6) CHECK (vacation_type in('월차','연차','병가')) not null,
vacation_start_date	date not NULL,
vacation_day	number(2) DEFAULT 1 not NULL,
vacation_recode	varchar2(60) not NULL,
vacation_state	varchar2(6)	CHECK (vacation_state in('승인','반려')) not null
);

--휴가 시퀀스 번호 생성
create sequence vacation_seq;

--직원 근태 테이블 생성
CREATE TABLE attendance (
attandance_no number	PRIMARY KEY,
attendance_staff_id	varchar2(30) references staff(staff_id) on delete set null,
attendance_start_time	date not NULL,
attendance_end_time	date NULL,
attendance_work_state varchar2(10) DEFAULT '근무중'  CHECK (attendance_work_state in('출근','결근','외근','업무중')) not null
);

--근태 시퀀스 번호 생성
create sequence attendance_seq;

--환자 테이블 생성
CREATE TABLE Patient (
patient_no number PRIMARY KEY,
patient_name varchar2(15) not null,
patient_birth date not null,
patient_gender	char(2) CHECK (patient_gender in('M','F'))	not null
);

--환자 시퀀스 번호 생성
create sequence Patient_seq;

--진료테이블 생성
CREATE TABLE diagnosis (
diagnosis_no number	PRIMARY KEY,
diagnosis_staff_id	varchar2(30) references staff(staff_id) on delete set null,
diagnosis_patient_no references patient(patient_no) on delete set null,
diagnosis_content	varchar2(3000)	not null,
diagnosis_date	date DEFAULT sysdate,
diagnosis_title	varchar2(300) not NULL,
patient_blood	char(1)	CHECK (patient_blood in('A','B','AB','O'))	not null
);

--진료 시퀀스 번호 생성
create sequence diagnosis_seq;


--진료 예약 테이블 생성
CREATE TABLE reservation (
reservation_no number PRIMARY KEY,
reservation_staff_id references staff(staff_id) on delete set null,
reservation_patient_no	number	references patient(patient_no) on delete set null,
reservation_date char(10) not NULL,
reservation_content	varchar2(300) not NULL,
reservation_time char(7) not NULL
);

--진료 예약 시퀀스 생성
create sequence reservation_seq;

--수술 테이블 생성
CREATE TABLE operation (
operation_no number	PRIMARY KEY,
operation_diagnosis_no references reservation(reservation_no) on delete set null,
operation_start_day	date DEFAULT sysdate not null,
operation_end	date DEFAULT sysdate not null,
operation_content varchar2(300) not null,
operation_title varchar2(100) not null
);

--수술 시퀀스 번호 생성
create sequence operater_seq;

--수술방 테이블 생성
CREATE TABLE operation_room (
operation_room_no number PRIMARY key,
operation_origin_no number references reservation(reservation_no) on delete set null,
operation_state varchar2(12) check(operation_state in('수술완료','수술중','수술대기'))
);

create sequence operation_room_seq;


--캘린더 테이블 생성
CREATE TABLE calender(
calender_no	number	PRIMARY KEY,
calender_staff_id	varchar2(30) references staff(staff_id) on delete set null,
calender_title	varchar2(100) not NULL,
calender_content varchar2(900) not null,
calender_regi_date	date not null,
calender_start_time	date not null,
calender_end_time	date not null,
allday_state	varchar2(10) ,
calener_state	char(1)	NULL
);


--캘린더 시퀀스 번호
create sequence calender_seq;

--date format
alter session set nls_date_format = 'yyyy-MM-dd hh24:mi';

--입원 테이블 생성
CREATE TABLE hospitalize(
hospitalize_no	number PRIMARY key,
hospitalize_diagnosis_no	number	references diagnosis(diagnosis_no) on delete set null,
hospitalize_staff_id varchar2(30)	references staff(staff_id) on delete set null,
hosptalize_patient_no	number	references patient(patient_no) on delete set null,
hospitalize_start_date	date not NULL,
hospitalize_end_date	date not NULL,
patient_guardian_name	varchar2(21) not NULL,
patient_guardian_phone	varchar2(21) not NULL
);

--입원 시퀀스 번호 생성
create sequence hospitalize_seq;

--병실 테이블 생성
CREATE TABLE sickroom (
sickroom_no number	PRIMARY key,
hospitalize_sickroom_no	number references hospitalize(hospitalize_no) on delete set null,
sickroom_size number(1) not NULL ,
sickroom_state varchar(12) DEFAULT '입원중'  check(sickroom_state in('입원중','퇴원')) not NULL,
sickroom_bed number(1) check(sickroom_bed > 0) UNIQUE not null
);

--진료 첨부파일 이미지
CREATE TABLE diagnosis_img (
img_attachment_no number references attachment(attachment_no) on delete set null,
img_diagnosis_no number references diagnosis(diagnosis_no) on delete set null
);

--차트 테이블 생성
CREATE TABLE chart(
chart_no number	PRIMARY key,
chart_diagnosis_no number references diagnosis(diagnosis_no) on delete set null,
chart_staff_name varchar2(30) references staff(staff_id) on delete set null,
chart_patient_no number	references patient(patient_no) on delete set null,
chart_content varchar2(300)	not NULL,
chrat_recodeTime date DEFAULT sysdate not null
);

--차트 시퀀스 번호 생성
create sequence chart_seq;



CREATE TABLE chat_room(
chat_room_no number	primary key,
chat_room_state char(2)	not null
);

CREATE TABLE chat_group (
chat_group_no	number	primary key,
chat_group_staff_id	varchar2(30) references staff(staff_id) on delete set null,
chat_group_room	number  references chat_room(chat_room_no) on delete set null
);

CREATE TABLE  chat_msg(
chat_msg_no number	primary key,
chat_room_origin_no number	references chat_room(chat_room_no) on delete set null,
chat_staff_id varchar2(30)	references staff(staff_id) on delete set null,
chat_msg_content varchar2(3000),
chat_msg_date date	DEFAULT sysdate
);


create sequence chat_msg_seq;

