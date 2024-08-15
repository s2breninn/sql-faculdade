/* LETRA F 
SP01: Utilizando a função criada no exercício anterior, elabore um 
procedimento que permita cadastrar cidades chamada de 
SP_CadastrarCidade(_NomeCidade, _UFCidade). Caso a cidade não possa ser inserida 
na tabela, seu procedimento deverá retornar o valor de controle/retorno -1.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS SP_CadastrarCidade;
CREATE PROCEDURE SP_CadastrarCidade(IN _NomeCidade VARCHAR(50),
									IN _UFCidade CHAR(2),
									OUT _RetornoCodCidade INTEGER)
BEGIN
	DECLARE _CODIGOCID INTEGER;
    
	SET _CODIGOCID = 0;

	SELECT
		FN_VerificarCidade(_NomeCidade, _UFCidade) INTO _CODIGOCID;
	
    IF (_CODIGOCID = -1) THEN 
		INSERT INTO cidade (nome, uf) VALUES (_NomeCidade, _UFCidade);
	END IF;
    SET _RetornoCodCidade = _CODIGOCID;
END $$
DELIMITER ;