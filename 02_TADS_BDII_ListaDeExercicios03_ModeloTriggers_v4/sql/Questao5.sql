/*Questão 5 - EMPRÉSTIMO BANCÁRIO – Outro cenário comum em nosso dia-a-dia é a quitação de um empréstimo
bancário ao longo do tempo. Utilizando o modelo ER abaixo elabore uma trigger que atualize o montante pago
por um cliente toda vez que ele efetua o pagamento de alguma parcela do referido empréstimo.*/
DELIMITER $$
CREATE TRIGGER TRG_ATUALIZAR_MONTANTE_DEVIDO
AFTER INSERT ON emprestimoparcela
FOR EACH ROW
BEGIN
	UPDATE emprestimo
    SET MontanteDevido = MontanteDevido + NEW.ValorPagar
    WHERE CodEmprestimo = NEW.CodEmprestimo;
END $$
DELIMITER ;

-- Trigger para diminuir o valor do montante devido a medida que são realizados os pagamentos
-- atualizando as colunas da data de pagamento e o valor pago
DELIMITER $$
CREATE TRIGGER TRG_SUB_MONTANTE_DEVIDO
AFTER UPDATE ON emprestimoparcela
FOR EACH ROW
BEGIN
	UPDATE emprestimo
    SET MontanteDevido = MontanteDevido - NEW.ValorPago
    WHERE CodEmprestimo = NEW.CodEmprestimo;
END $$
DELIMITER ;