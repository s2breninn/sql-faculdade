/*Questão 4 - ATUALIZAÇÃO DE ESTOQUES – Analise um cenário de atualização de estoques e produtos e elabore
uma trigger que seja capaz de atualizar automaticamente o estoque de um determinado produto que teve sua
venda finalizada. Proponha as tabelas do modelo.*/

-- DROP TRIGGER TGR_ATUALIZA_ESTOQUE;
DELIMITER $$
CREATE TRIGGER TGR_ATUALIZA_ESTOQUE
AFTER INSERT ON itempedido
FOR EACH ROW
BEGIN
	UPDATE produto
    SET Quantidade = Quantidade - NEW.Quantidade
    WHERE CodProduto = NEW.CodProduto;
END $$
DELIMITER ;

-- DROP TRIGGER TGR_REMOVE_ITEM_CANCELADO;
DELIMITER $$
CREATE TRIGGER TGR_REMOVE_ITEM_CANCELADO
AFTER DELETE ON itempedido
FOR EACH ROW
BEGIN
	UPDATE produto
    SET Quantidade = Quantidade + OLD.Quantidade
    WHERE CodProduto = OLD.CodProduto;
END $$
DELIMITER ;

-- DROP TRIGGER TGR_SOMA_VALORTOTAL;
DELIMITER $$
CREATE TRIGGER TGR_SOMA_VALORTOTAL
AFTER INSERT ON itempedido
FOR EACH ROW
BEGIN
	UPDATE pedido
    SET ValorTotal = ValorTotal + NEW.ValorUnitario
    WHERE CodPedido = NEW.CodPedido ;
END $$
DELIMITER ;

-- DROP TRIGGER TRG_SUB_VALORTOTAL;
DELIMITER $$
CREATE TRIGGER TRG_SUB_VALORTOTAL
AFTER DELETE ON itempedido
FOR EACH ROW
BEGIN
	UPDATE pedido
    SET ValorTotal = ValorTotal - OLD.ValorUnitario
    WHERE CodPedido = OLD.CodPedido ;
END $$
DELIMITER ;