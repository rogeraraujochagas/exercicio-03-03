create database Recursos_humanos;
go

use Recursos_humanos


 create table funcionario
 (codigofunc  int primary key not null,
 nomefunc     varchar(30)     not null,
 emailfunc    varchar (40)    not null,
 telefonefunc numeric (9)     not null,)

create table funcionariobackupinsert
 (codigofunc  int primary key not null,
 nomefunc     varchar(30)     not null,
 emailfunc    varchar (40)    not null,
 telefonefunc numeric (9)     not null,)
 go

 create table funcionariobackupdelete
 (codigofunc  int primary key not null,
 nomefunc     varchar(30)     not null,
 emailfunc    varchar (40)    not null,
 telefonefunc numeric (9)     not null,)
 go

select * from funcionario
select * from funcionariobackupinsert
select * from funcionariobackupdelete
go

create trigger trg_insertfuncionario on funcionario
  after insert
  as begin
     insert into funcionariobackupinsert
	 select * from inserted
	 end
go	  

create trigger trg_deletefuncionario on funcionario
  after delete
  as begin
     insert into funcionariobackupdelete
	 select * from deleted
	 end
go	  
 
 insert into funcionario (codigofunc, nomefunc, emailfunc, telefonefunc)
 values (5, 'Edson Dionisio', 'edson.dionisio@gmail.com', 997402801), 
        (8, 'Maitê Silva',  'maite.silva@gmail.com', 997402801),
 		(12, 'Marilia Késsia', 'testekessia@gmail.com', 997402801);
go

/* verificando o conteúdo das tabelas */
select * from funcionario
select * from funcionariobackupinsert
select * from funcionariobackupdelete
go

/* fazendo delete de dados na tabela funcionario*/
delete from funcionario
where codigofunc  = 8;
go

select * from sysobjects where type ='TR';



