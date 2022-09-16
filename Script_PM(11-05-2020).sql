/*
Created		13/04/2020
Modified		04/05/2020
Project		
Model		
Company		
Author		
Version		
Database		Oracle 10g 
*/


Drop table Itens_Fornecedor
/
Drop table Itens_Compras
/
Drop table Itens_Vendas
/
Drop table ContasReceber
/
Drop table ContasPagar
/
Drop table Compras
/
Drop table Vendas
/
Drop table Produtos
/
Drop table Fornecedores
/
Drop table Clientes
/


-- Create Types section


-- Create Tables section


Create table Clientes (
	CLI_Codigo Number NOT NULL ,
	CLI_Nome Varchar2 (30),
	CLI_Endereco Varchar2 (30),
	CLI_Bairro Varchar2 (30),
	CLI_Cidade Varchar2 (30),
	CLI_Estado Varchar2 (2),
	CLI_CEP Varchar2 (9),
	CLI_Telefone Varchar2 (13),
	CLI_Celular Varchar2 (14),
	CLI_CPF Varchar2 (14),
	CLI_RG Varchar2 (12)
) 
/

Create table Fornecedores (
	FOR_Codigo Number NOT NULL ,
	FOR_Razao Varchar2 (30),
	FOR_Endereco Varchar2 (30),
	FOR_Bairro Varchar2 (30),
	FOR_Cidade Varchar2 (30),
	FOR_Estado Varchar2 (2),
	FOR_CEP Varchar2 (9),
	FOR_Telefone Varchar2 (13),
	FOR_Celular Varchar2 (14),
	FOR_CNPJ Varchar2 (18),
	FOR_IE Varchar2 (15)
) 
/

Create table Produtos (
	PRO_Codigo Number NOT NULL ,
	PRO_Descricao Varchar2 (30),
	PRO_Cor Varchar2 (15),
	PRO_Peso Varchar2 (4),
	PRO_Embalagem Varchar2 (4),
	PRO_Preco_Custo Number(10,2),
	PRO_Margem_Lucro Number,
	PRO_Preco_Venda Number(10,2)
) 
/

Create table Vendas (
	VEN_Codigo Number NOT NULL ,
	CLI_Codigo Number NOT NULL ,
	VEN_Data Date,
	VEN_Nota_Fiscal Varchar2 (30),
	VEN_Endereco_Entrega Varchar2 (30),
	VEN_ICMS Number(10,2),
	VEN_IPI Number(10,2),
	VEN_Total_Venda Number(10,2)
) 
/

Create table Compras (
	COM_Codigo Number NOT NULL ,
	FOR_Codigo Number NOT NULL ,
	COM_Data Date,
	COM_Nota_Fiscal Varchar2 (30),
	COM_ICMS Number(10,2),
	COM_IPI Number(10,2),
	COM_Total Number(10,2)
) 
/

Create table ContasPagar (
	CTP_Codigo Number NOT NULL ,
	COM_Codigo Number NOT NULL ,
	CTP_Vencimento Date,
	CTP_Valor Number(10,2),
	CTP_DT_Pagamento Date,
	CTP_VL_Pagamento Number(10,2),
	CTP_Pago Varchar2 (3)
) 
/

Create table ContasReceber (
	CTR_Codigo Number NOT NULL ,
	VEN_Codigo Number NOT NULL ,
	CTR_Vencimento Date,
	CTR_Valor Number(10,2),
	CTR_DT_Recebimento Date,
	CTR_VL_Recebimento Number(10,2),
	CTR_Recebido Varchar2 (3)
) 
/

Create table Itens_Vendas (
	VEN_Codigo Number NOT NULL ,
	PRO_Codigo Number NOT NULL ,
	VEP_QT_Produto_Item Number,
	VEP_DS_Produto_Item Varchar2 (30),
	VEP_VL_Unitario_Item Number(10,2),
	VEP_VL_Total_Item Number(10,2)
) 
/

Create table Itens_Compras (
	COM_Codigo Number NOT NULL ,
	PRO_Codigo Number NOT NULL ,
	COP_QT_Produto_Item Number,
	COP_DS_Produto_Item Varchar2 (30),
	COP_VL_Unitario_Item Number(10,2),
	COP_VL_Total_Item Number(10,2)
) 
/

Create table Itens_Fornecedor (
	FOR_Codigo Number NOT NULL ,
	PRO_Codigo Number NOT NULL ,
	FOP_Preco_Custo_Fornecedor Number(10,2),
	FOP_Margem_Lucro_Fornecedor Number,
	FOP_Preco_Venda_Fornecedor Number(10,2)
) 
/


-- Create section for PKs, AKs and Unique constraints, which have to be generated after Indexes


-- Create Foreign keys section

Alter table Vendas add  foreign key (CLI_Codigo) references Clientes (CLI_Codigo) 
/

Alter table Compras add  foreign key (FOR_Codigo) references Fornecedores (FOR_Codigo) 
/

Alter table Itens_Fornecedor add  foreign key (FOR_Codigo) references Fornecedores (FOR_Codigo) 
/

Alter table Itens_Vendas add  foreign key (PRO_Codigo) references Produtos (PRO_Codigo) 
/

Alter table Itens_Compras add  foreign key (PRO_Codigo) references Produtos (PRO_Codigo) 
/

Alter table Itens_Fornecedor add  foreign key (PRO_Codigo) references Produtos (PRO_Codigo) 
/

Alter table Itens_Vendas add  foreign key (VEN_Codigo) references Vendas (VEN_Codigo) 
/

Alter table ContasReceber add  foreign key (VEN_Codigo) references Vendas (VEN_Codigo) 
/

Alter table Itens_Compras add  foreign key (COM_Codigo) references Compras (COM_Codigo) 
/

Alter table ContasPagar add  foreign key (COM_Codigo) references Compras (COM_Codigo) 
/


-- Create Object Tables section


-- Create XMLType Tables section


-- Create Functions section


-- Create Sequences section


-- Create Packages section


-- Create Synonyms section


-- Create Table comments section


-- Create Attribute comments section


