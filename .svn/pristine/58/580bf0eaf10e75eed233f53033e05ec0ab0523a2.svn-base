create sequence hibernate_sequence minvalue 200;

    create table academic_records (
        id int4 not null,
        fileName varchar(255),
        gpa varchar(255),
        gre_score varchar(255),
        toefl_score varchar(255),
        transcript bytea,
        primary key (id)
    );

    create table additional_field_values (
        id int4 not null,
        extraFileName varchar(255),
        extra_file bytea,
        field_value varchar(255),
        add_info_field_id int4,
        applications_field_id int4,
        primary key (id)
    );

    create table additional_info (
        id int4 not null,
        field_name varchar(255),
        field_type varchar(255),
        required boolean,
        dept_id int4,
        primary key (id)
    );

    create table applications (
        id int4 not null,
        CIN varchar(255),
        DateOfBirth varchar(255),
        citizenship varchar(255),
        date_submitted varchar(255),
        emailId varchar(255),
        firstName varchar(255),
        gender varchar(255),
        is_International boolean not null,
        lastName varchar(255),
        phoneNo varchar(255),
        term varchar(255),
        dept_applications int4,
        program_applications int4,
        applications_records int4,
        student_applications int4,
        primary key (id)
    );

    create table authorities (
        user_id int4 not null,
        role varchar(255)
    );

    create table degrees (
        id int4 not null,
        collegeUniv_name varchar(255),
        date_end varchar(255),
        date_start varchar(255),
        degree_name varchar(255),
        major_name varchar(255),
        application_degree int4,
        primary key (id)
    );

    create table dept (
        id int4 not null,
        dept_name varchar(255),
        is_gre_required boolean not null,
        primary key (id)
    );

    create table grad_progs (
        id int4 not null,
        prog_name varchar(255),
        dept_id int4,
        primary key (id)
    );

    create table status (
        id int4 not null,
        comments varchar(255),
        status varchar(255),
        time_stamp varchar(255),
        applications_status_id int4,
        user_status_id int4,
        primary key (id)
    );

    create table users (
        id int4 not null,
        email_id varchar(255) not null,
        firstname varchar(255),
        lastname varchar(255),
        password varchar(255) not null,
        primary key (id)
    );

    alter table users 
        add constraint UK_pwrpg821nujmmnavoq7s420jn unique (email_id);

    alter table additional_field_values 
        add constraint FK_1fjffbsin9hoe90bcvamu0cup 
        foreign key (add_info_field_id) 
        references additional_info on delete set null;

    alter table additional_field_values 
        add constraint FK_aulrw7fv3fbgexdtuulqbak 
        foreign key (applications_field_id) 
        references applications on delete set null;

    alter table additional_info 
        add constraint FK_6pib03m9h1jyq69p1gi3teed2 
        foreign key (dept_id) 
        references dept on delete set null;

    alter table applications 
        add constraint FK_35snsa9vvsgaccp3dyab7oubb 
        foreign key (dept_applications) 
        references dept on delete set null;

    alter table applications 
        add constraint FK_ajwjo6giyw5hqe4kf6oqplcbp 
        foreign key (program_applications) 
        references grad_progs on delete set null;

    alter table applications 
        add constraint FK_sks2794hjtejkewkppgfhnrj4 
        foreign key (applications_records) 
        references academic_records on delete set null;

    alter table applications 
        add constraint FK_adyok3alt9hij3tlfmd2ac84v 
        foreign key (student_applications) 
        references users on delete set null;

    alter table authorities 
        add constraint FK_s21btj9mlob1djhm3amivbe5e 
        foreign key (user_id) 
        references users on delete set null;

    alter table degrees 
        add constraint FK_q05oe2fg1ca64dl1emxsbbcj7 
        foreign key (application_degree) 
        references applications on delete set null;

    alter table grad_progs 
        add constraint FK_10wp5f7glpysfil7s3v15tst 
        foreign key (dept_id) 
        references dept on delete set null;

    alter table status 
        add constraint FK_5aavri5r6sj0xfjd96dqr8y1e 
        foreign key (applications_status_id) 
        references applications on delete set null;

    alter table status 
        add constraint FK_8nilpiy9hhosaa29bv89uqqp0 
        foreign key (user_status_id) 
        references users on delete set null;


	insert into users values (101, 'admin@localhost.localdomain', 'Jane', 'Doe', 'abcd');
	insert into users values (102, 'staff1@localhost.localdomain', 'John', 'Browne', 'abcd');
	insert into users values (103, 'staff2@localhost.localdomain', 'Kite', 'Green', 'abcd');
	insert into users values (104, 'student1@localhost.localdomain', 'Ross', 'Milton', 'abcd');
	insert into users values (105, 'student2@localhost.localdomain', 'Lisa', 'Doe', 'abcd');

	insert into authorities values(101, 'Admin');
	insert into authorities values(102, 'Staff');
	insert into authorities values(103, 'Staff');
	insert into authorities values(104, 'Student');
	insert into authorities values(105, 'Student');

	insert into dept values(161, 'Accounting', False);
	insert into dept values(162, 'Computer Science', False);

	insert into grad_progs values(111, 'MS in Accounting program', 161);
	insert into grad_progs values(112, 'MS in Computer Science program', 162);

	insert into additional_info values(121, 'GMAT score', 'String', true, 161);
	insert into academic_records values(131, null, '3.5', null, '100', null);
	insert into applications values(141, '1234', '1/2/1990', 'US', '02/24/2016', 'student1@localhost.localdomain', 'Ross', 'Female', False, 'Milton', '123456', 'Fall 2016', 161, 111, 131, 104);
	insert into degrees values(151, 'University of Florida', '08/2014', '08/2010', 'BS', 'Accounting program', 141);
	insert into status values(171, null, 'New', '13:45', 141, 105);
	insert into additional_field_values values (181, null, null, '100', 121, 141);
