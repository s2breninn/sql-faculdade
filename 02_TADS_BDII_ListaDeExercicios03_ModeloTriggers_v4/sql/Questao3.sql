/*Questão 3 - AUDITORIA DOS DADOS – Vamos realizar uma operação de Auditoria em nosso banco de dados. Para
isso, crie uma tabela chamada “auditoria” com as seguintes especificações:
• Atributos: Data (datetime, not null); Descrição (varchar[200], not null);
• Exemplo de Dados: 10/03/2015 15:35 – Alteração na tabela de pessoa – Código 15
 02/05/2016 08:12 – Inserção na tabela de pessoa – Código 5
 * Obs 1: para obter a data e hora atual utilize a função nativa now() e para concatenar string com inteiro, utilize a
função concat(valor 1, valor 2);
 * Obs 2: será necessário criar uma tabela chamada “pessoa” com a quantidade de atributos que julgar necessário.
Por fim, crie TRÊS triggers que realizem as operações de inserção, alteração ou exclusão de registros na tabela
de Pessoa, e que automaticamente insira um registro na tabela Auditoria com a data/hora de execução e uma
breve descrição da operação.*/

CREATE TABLE pessoa (
	CodPessoa 	integer not null auto_increment,
    Nome		varchar(50) not null,
    Sexo		char,
    Idade		int,
    constraint PK_Pessoa_CodPessoa primary key(CodPessoa)    
);

-- DROP TRIGGER TRG_INSERIR_AUDITORIA;
DELIMITER $$
CREATE TRIGGER TRG_INSERIR_AUDITORIA 
AFTER INSERT ON pessoa
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (Data, Descricao) 
        VALUES (now(), CONCAT("Inserção da Pessoa - Código ",NEW.CodPessoa,
				" Nome=",NEW.Nome, 
                ", Idade=",NEW.Idade, 
                ", Sexo=",NEW.Sexo));        
END $$
DELIMITER ;

-- DROP TRIGGER TRG_EXCLUIR_AUDITORIA;
DELIMITER $$
CREATE TRIGGER TRG_EXCLUIR_AUDITORIA 
AFTER DELETE ON pessoa
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (Data, Descricao) 
        VALUES (now(), CONCAT("Exclusão da Pessoa - Código=",OLD.CodPessoa,
				" Nome=",OLD.Nome, 
                ", Idade=",OLD.Idade, 
                ", Sexo=",OLD.Sexo));
END $$
DELIMITER ;

-- DROP TRIGGER TRG_ATUALIZAR_AUDITORIA;
DELIMITER $$
CREATE TRIGGER TRG_ATUALIZAR_AUDITORIA 
AFTER UPDATE ON pessoa
FOR EACH ROW
BEGIN
	INSERT INTO auditoria (Data, Descricao) 
		VALUES (now(), CONCAT("Alteração da Pessoa - Código=",OLD.CodPessoa," - DE:",
				" Nome=",OLD.Nome, 
                ", Idade=",OLD.Idade, 
                ", Sexo=",OLD.Sexo));                
	
	INSERT INTO auditoria (Data, Descricao) 
		VALUES (now(), CONCAT("Alteração da Pessoa - Código=",OLD.CodPessoa," - PARA:",
				" Nome=",NEW.Nome, 
                ", Idade=",NEW.Idade, 
                ", Sexo=",NEW.Sexo));
END $$
DELIMITER ;