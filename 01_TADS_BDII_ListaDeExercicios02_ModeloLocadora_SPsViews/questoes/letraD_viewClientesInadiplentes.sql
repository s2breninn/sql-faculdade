/* Letra D
View04: Elabore uma view chamada de VW_ClientesInadimplentes que imprima a relação
completa de clientes que estão com atraso na devolução dos filmes alugados. (campos de saída:
CodCliente, Nome Cliente, Código do Filme, Nome do Filme, Data de Locação, Data Prevista de
Devolução, Valor de Locação)*/
DROP VIEW IF EXISTS VW_ClientesInadimplentes;
CREATE OR REPLACE VIEW VW_ClientesInadimplentes AS
    SELECT 
        c.codcliente AS codcliente,
        c.nome AS nome_cliente,
        f.codfilme AS codfilme,
        f.nome AS nome_filme,
        l.datalocacao AS datalocacao,
        l.datadevolucaoprevista AS datadevolucaoprevista,
        l.valorlocacao AS valorlocacao
    FROM
        cliente c
    JOIN locacao l ON c.codcliente = l.codcliente
    JOIN filme f ON l.codfilme = f.codfilme
    WHERE
        l.datadevolucaoprevista < CURDATE()
        AND l.datadevolucao IS NULL;