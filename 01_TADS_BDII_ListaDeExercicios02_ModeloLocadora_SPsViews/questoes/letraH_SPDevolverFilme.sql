/* Letra H
SP03: Desenvolva um procedimento chamado SP_DevolverFilme que realize o registro da
devolução de um determinado filme na locadora.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS SP_DevolverFilme;
CREATE PROCEDURE SP_DevolverFilme(
    IN p_codcliente INT,         -- Identificador do cliente
    IN p_codfilme INT,           -- Identificador do filme
    IN p_datadevolucao DATE      -- Data de devolução
)
BEGIN
    -- Atualiza a data de devolução e o status para devolvido
    UPDATE locacao
    SET datadevolucao = p_datadevolucao,
        statuslocacao = 'D'
    WHERE codcliente = p_codcliente
    AND codfilme = p_codfilme
    AND statuslocacao = 'E';    -- Somente atualiza se a locação estiver em andamento (status 'E')
    
    -- Adicione aqui verificações ou lógica adicional, se necessário.
END $$
DELIMITER ;