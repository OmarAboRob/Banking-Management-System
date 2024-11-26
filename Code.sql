create table Main_Bank(
   Bank_Number number primary key ,
   Manager_Id varchar2(40),
   Bank_Address varchar2(20));

create table Bank_Branch(
    Branch_number number primary key ,
    address varchar2(40) ,
    MBank_number number not null ,
    manager_id number );

create table employees (
    employee_id number primary key ,
    Name varchar2(40),
    Address varchar2(40),
    salary number(10,2),
    department_id number ,
    job_id number ,
    phone_number number ,
    hire_date date ,
    Branch_Num number not null );

 create table departments (
    department_id number primary key ,
    department_Name varchar2(40));

 create table customer (
    customer_id number primary key  ,
    name varchar2(40),
    phone number ,
    address varchar2(40),
    email varchar2(20));

create table jobs (
    job_id number primary key,
    job_name varchar(20));

create table account (
    account_id number primary key,
    balance number(20,2),
    Branch_number number not null,
    customer_id number not null);

create table loan (
    loan_id number primary key,
    amount number,
    duration_time varchar(20),
    customer_id number,
    Branch_number number not null);

create table financial_transacctions (
    tran_id number,
    type varchar(20),
    amount number,
    currency varchar(20),
    account_id number,
    primary key(tran_id,account_id));

create table customer_service (
    customer_id number,
    employee_id number,
    time varchar(20),
    service_date date,
    service_num number,
    primary key (customer_id,employee_id,service_num));

create table saving_acc (
    account_id number primary key,
    blocking_time varchar(20));

create table current_acc (
    account_id number primary key,
    cheque_book_no number);

create table debit_acc (
    account_id number primary key,
    interest number(2,2));

create table personal_loans (
    loan_id number primary key,
    sponsor varchar(40));.

create table home_equity_loans (
    loan_id number primary key,
    contract varchar(40));

create table student_loans (
    loan_id number primary key,
    student_id number,
    tuition number);

alter table employees add ( constraint fk_empbranch foreign key ( Branch_Num) references Bank_Branch ( Branch_number));

alter table Main_Bank  add ( constraint fk_main foreign key (manager_id) references employees (employee_id));

 alter table Bank_Branch add (constraint fk_manager foreign key (manager_id) references employees (employee_id ));

 alter table bank_branch add( constraint fk_branch foreign key( Mbank_number) references Main_Bank(Bank_Number));

alter table employees add ( constraint fk_dept foreign key(department_id) references departments(department_id));

alter table employees add ( constraint fk_jobs foreign key (job_id) references jobs(job_id));

alter table loan add( constraint fk_loanBranch foreign key(branch_number) references bank_branch(branch_number));

 alter table loan add( constraint fk_loanCust foreign key(customer_id) references customer(customer_id));

alter table account add(constraint fk_accountBranch foreign key(branch_number) references Bank_branch(branch_number));

 alter table account add(constraint fk_accountCust foreign key(customer_id) references customer(customer_id));

alter table customer_service add(constraint fk_cs foreign key(customer_id) references customer(customer_id));

alter table financial_transacctions add(constraint fk_ftacc foreign key(account_id) references account(account_id));

 alter table personal_loans add(constraint inh_pl foreign key(loan_id) references loan(loan_id));

 alter table home_equity_loans add(constraint inh_hel foreign key(loan_id) references loan(loan_id)); 

 alter table student_loans add(constraint inh_sl foreign key(loan_id) references loan(loan_id));  

alter table saving_acc add constraint inh_sacc foreign key(account_id) references account(account_id);

alter table current_acc add constraint inh_cacc foreign key(account_id) references account(account_id);

alter table debit_acc add constraint inh_dacc foreign key(account_id) references account(account_id);


-- Bank_branch Insertion
insert into Main_bank values( 3000,null,'Jerusalem');
insert into Bank_branch values( 301000,'Jerusalem',3000,null);
insert into Bank_branch values( 301100,'Jenin',3000,null);
insert into Bank_branch values( 301200,'Nablus',3000,null);
insert into Bank_branch values( 301300,'Hebron',3000,null);

-- Departments Insertion

insert into Departments values(101,'Customer Service');
insert into Departments values( 102,'Loans');
insert into Departments values( 103,'Tellers');
insert into Departments values( 104,'Financial Transfers');
insert into Departments values( 105,'Saving accounts');

-- Jobs Insertion

insert into Jobs values( 15,'IT-Support');
insert into Jobs values( 20,'Secretary');
insert into Jobs values( 25,'Security');
insert into Jobs values( 30,'Accounting');
insert into Jobs values( 35,'Administration');



-- Employees Insertion

insert into Employees values( 20201000,'Mahmoud Abbas','Jerusalem',7500,null,35,0598999999, '1-jan-2020',301000);
insert into Employees values( 20201001,'Yahya Ziyad','Tubas',3500,103,25,0593456352,'12-jan-2020',301100);
insert into Employees values(20201002,'Orwa Samara','Jenin',3800,101,20,0569034723,'11-feb-2020',301100);
insert into Employees values( 20201003,'Omar Ahmad','Jenin ',4500,102,30,0599785230,'29-jul-2020',301100);
insert into Employees values( 20201004,'Arein Samara','Nablus',2700,104,15,0598213756,'20-aug-2020',301200);
insert into Employees values(20201005,'Adel Hantouli','Hebron ',5100,105,15,0569954356, '10-jan-2020',301300);
insert into Employees values(20201006,'Yazan Abed','Jerusalem ',6300,101,35,0569957777, '1-jan-2020',301000);

-- customer Insertion

 insert into customer values( 11112000,'Ahmad Abdallah',0592314527,'Jenin',ahmad21@gmail.com);
insert into customer values( 11112001,'Saeed Jamal', 0563452139,'Nablus',saeedjamal@outlook.com);
insert into customer values( 11112002,'Rami Dawood', 0598356342,'Hebron', rami.d3@gmail.com);
insert into customer values( 11112003,'Jamal Malash', 0599734725, 'Hebron', j.malash@yahoo.com);
insert into customer values( 11112004, 'Raed Hamdon', 0594231256, 'Jenin', redo32@gmail.com);
insert into customer values( 11112005, 'Bilal Hanaisheh', 0567787945, 'Jenin', bilal1996@gmail.com);



-- account Insertion

insert into account values (45002000, 2500 , 301100 , 11112000);
insert into account values(45002001, 12300 , 301200 , 11112001);
insert into account values(45002002, 54600 , 301300 , 11112002);
insert into account values(45002003, 94000 , 301300 , 11112003);
insert into debit_acc values ( 45002003 ,0.05);
insert into current_acc values (45002002, 10101010);
insert into saving_acc values (45002001, '5 years');

-- loan Insertion

insert into loan values ( 1,100000, '5 years',11112004,301300);
insert into loan values (2,155000, '7 years',11112005,301300);
insert into loan values (3,250000, '3 years',11112003,301200);
insert into student_loans values( 1 , 202011555,2500);
insert into personal_loans values( 2, 'Majd COMP');
insert into home_equity_loans values (3 , 'Car Contract');

-- Financial_transacctions Insertion

insert into Financial_transacctions values( 100, 'withdraw' , 2000, 'dollar',45002000);
insert into Financial_transacctions values( 102, 'Transfer',6000, 'Shekel, 45002003);
insert into Financial_transacctions values( 101, 'deposit' , 1000, 'JDinnar',45002002);
insert into Financial_transacctions values(  102, 'deposit',2000, 'Shekel, 45002003);
insert into Financial_transacctions values( 102, 'withdraw',15000, 'Shekel, 45002003);



-- customer_service Insertion

insert into customer_service values ( 11112005,20201002, '10 minutes','12-dec-2022',1000);
insert into customer_service values ( 11112004,20201002,'9 minutes','16-nov-2022',1001);
insert into customer_service values ( 11112003,20201002, '20 minutes','18-oct-2022',1002 );
insert into customer_service values ( 11112000,20201002, '5 minutes' , '15-jan-2023',1003 );
insert into customer_service values ( 11112001,20201002, '7 minutes' , '12-dec-2022',1004);

-- managers updates

update Main_bank set manager_id=20201000 where Bank_number= 3000;
update Bank_branch set manager_id=20201006 where Branch_number= 301000;
update Bank_branch set manager_id=20201004 where Branch_number=301200;
update Bank_branch set manager_id=20201002 where Branch_number= 301100;
update Bank_branch set manager_id=20201005 where branch_number= 301300;
