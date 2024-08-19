/*Questão 6 - ATUALIZAÇÃO SALARIAL DO DEPARTAMENTO – Nesse exercício você terá que automatizar o cálculo
do valor total dos salários de um departamento. Toda vez que um novo empregado é lotado ou movido de
departamento, ou ainda, tem seu salário modificado, o atributo que mantém o valor total dos salários daquele
departamento deve ser atualizado. Desse modo, considerando o Modelo ER abaixo e crie triggers necessárias
para realizar essas operações.*/
DELIMITER $$
CREATE TRIGGER TRG_AFTER_INSERT_EMPREGADO
AFTER INSERT ON EMPREGADO
FOR EACH ROW
BEGIN
	UPDATE Departamento
		SET TotalSalarios = TotalSalarios + NEW.Salario
        WHERE CodDepartamento = NEW.CodDepartamento;
END $$
DELIMITER ;

-- DROP TRIGGER TRG_AFTER_UPDATE_EMPREGADO;
DELIMITER $$
CREATE TRIGGER TRG_AFTER_UPDATE_EMPREGADO
AFTER UPDATE ON EMPREGADO
FOR EACH ROW
BEGIN
    -- Mudança de Departamento
    IF (NEW.CodDepartamento <> OLD.CodDepartamento) THEN
			UPDATE Departamento
				SET TotalSalarios = TotalSalarios - OLD.Salario
				WHERE CodDepartamento = OLD.CodDepartamento; 
			
			UPDATE Departamento
				SET TotalSalarios = TotalSalarios + NEW.Salario 
				WHERE CodDepartamento = NEW.CodDepartamento; 
    ELSE -- Alteração de Salário
		IF (NEW.Salario <> OLD.Salario) THEN
			UPDATE Departamento
			SET TotalSalarios = TotalSalarios + (NEW.Salario - OLD.Salario)
			WHERE CodDepartamento = OLD.CodDepartamento; 
		END IF;
	END IF;    
END $$
DELIMITER ;