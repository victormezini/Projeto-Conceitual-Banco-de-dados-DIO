-- explorando os comandos ddl

select now() as Timestamp;


create database if not exists manipulation;
use manipulation;

Create table bankAccounts (
	Id_account INT auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint identification_account_constraint unique (Ag_num, Ac_num)
);

alter table bankAccounts add LimiteCredito float not null default 500.00;
alter table bankClient add UFF char(2) not null default 'RJ';
alter table bankClient add Endereço varchar(100) not null;
insert into bankAccounts (Ag_num, Ac_num, Saldo) values(156,264358,0);
insert into bankClient (ClientAccount, CPF, RG, Nome, Endereço, Renda_mensal) values(1,12345678913,123456789,'Fulano','rua de lá',6500.6);
select * from bankClient;

update bankClient set UFF='SP' where Nome='Fulano';

create table bankClient(
	Id_client int auto_increment,
    ClientAccount int,
    CPF char(11) not null,
    RG char(9) not null,
    Nome varchar(50) not null,
    Renda_mensal float,
    primary key (iD_client, ClientAccount),
    constraint fk_account_client foreign key (ClientAccount) references bankAccounts(Id_account)
    on update cascade
    );
    
    
    create table bancktrasactions(
		Id_transaction INT auto_increment primary key,
        Ocorrencia datetime,
        Status_transaction varchar(20),
        Valor_transferido float,
        Source_account int,
        Destination_account int,
        constraint fk_source_transaction foreign key (Source_account) references
        bankAccounts(id_Account),
        constraint fk_destination_transaction foreign key (destination_account) references
        bankAccounts(id_Account)
        );
        
        