/* Letra I
 FN02: Implemente uma função chamada FN_ClientesAdimplentes(_CPFCliente) que
verifique se um determinado cliente é adimplente, ou seja, não possui locações em atraso:
     * Retorne o valor 0 (zero) caso seja um cliente adimplente; ou
     * Retorne um valor referente a quantidade de filmes em atraso de devolução, caso seja
inadimplente.*/
DELIMITER $$
DROP FUNCTION IF EXISTS FN_ClientesAdimplentes;
CREATE FUNCTION FN_ClientesAdimplentes(_CPFCliente VARCHAR(11))
RETURNS INT deterministic
BEGIN
    DECLARE filmes_em_atraso INT;
    
    SELECT COUNT(*) INTO filmes_em_atraso
    FROM locacao l
    JOIN cliente c ON l.codcliente = c.codcliente
    WHERE c.cpf = _CPFCliente
    AND l.datadevolucao > l.datadevolucaoprevista;
    
    IF filmes_em_atraso = 0 THEN
        RETURN 0;
    ELSE
        RETURN filmes_em_atraso;
    END IF;
END $$
DELIMITER ;