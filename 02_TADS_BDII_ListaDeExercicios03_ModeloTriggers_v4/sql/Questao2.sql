/*Questão 2 - EXCLUSÃO DE FUNCIONÁRIOS – Uma situação comum em um banco de dados para controle de gestão
de pessoas é a exclusão em cascata, ou seja, ao remover um registro de uma tabela primária todos os registros
da tabela secundária relacionados ao registro excluído são removidos automaticamente. Nesse cenário,
analisando o DER abaixo, elabore uma trigger que realize essa operação de exclusão em cascata.*/

CREATE TRIGGER TRG_EXCLUSAO_FUNC
BEFORE DELETE ON funcionario
FOR EACH ROW
BEGIN
	DELETE FROM dependente
    WHERE CodFuncionario = OLD.CodFuncionario;
END $$
DELIMITER ;