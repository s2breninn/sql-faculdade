/* Questão 1 - Reproduza o modelo de banco de dados abaixo e elabore DUAS
TRIGGERS que permita simular uma operação de Caixa de Supermercado, onde a tabela CAIXA mantém o saldo
inicial e final do caixa atualizados sempre que uma VENDA é realizada ou cancelada. Assim sendo, ao realizar
uma venda o seu valor deve ser somado ao saldo final do caixa, e quando uma venda for cancelada, o valor deve
ser devolvido ao saldo final do caixa.*/
DELIMITER $$
CREATE TRIGGER TRG_SALDO_CX
AFTER INSERT ON vendas
FOR EACH ROW
BEGIN
	UPDATE caixa
    SET SaldoFinal = SaldoFinal + NEW.ValorVenda
    WHERE DataCaixa = NEW.DataHoraVenda;
END $$
DELIMITER ;

-- TGR Cancelar venda do caixa
DELIMITER $$
CREATE TRIGGER TRG_CANCELAR_CX
AFTER DELETE ON vendas
FOR EACH ROW
BEGIN
	UPDATE caixa
    SET SaldoFinal = SaldoFinal - OLD.ValorVenda
    WHERE DataCaixa = OLD.DataHoraVenda;
END $$
DELIMITER ;