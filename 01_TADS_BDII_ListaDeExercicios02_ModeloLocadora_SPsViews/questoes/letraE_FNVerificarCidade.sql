/* LETRA E)  
 FN01: Elabore uma função chamada FN_VerificaCidade(_IdCidade) 
que verifica a existência de uma determinada cidade no banco de dados: 
• Se a cidade existir, a função retorna o ID da cidade; 
• Se a cidade não existir, a função retorna o valor -1; */
DELIMITER $$
DROP FUNCTION IF EXISTS FN_VerificarCidade;
CREATE FUNCTION FN_VerificarCidade(_NomeCidade VARCHAR(50), _UFCidade CHAR(2))
	RETURNS INTEGER DETERMINISTIC
BEGIN
	DECLARE _RETORNO, _CODIGOCID INTEGER; -- DECLARAÇÃO
    SET _RETORNO = -1; -- ATRIBUIÇÃO DE VALOR
    SET _CODIGOCID = 0; -- ATRIBUIÇÃO DE VALOR
    
    SELECT 
		codcidade INTO _CODIGOCID
    FROM 
		cidade
    WHERE 
		(nome LIKE _NomeCidade) AND
        (uf LIKE _UFCidade);
    
    IF (_CODIGOCID != 0) THEN
		SET _RETORNO = _CODIGOCID;
    END IF;
    
	RETURN _RETORNO;
END $$
DELIMITER ;