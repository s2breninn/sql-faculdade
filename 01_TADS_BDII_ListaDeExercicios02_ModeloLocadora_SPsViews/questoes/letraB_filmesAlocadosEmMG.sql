-- View02: Elabore uma view chamada de VW_FilmesAlocadosEmMG que apresente todos os
-- filmes alocados por clientes mineiros que ainda não foram devolvidos – da alocação mais recente ao
-- mais antigo. (campos de saída: Código do Filme, Nome do Filme, Data de Alocação, Data de
-- Devolução, Código do Cliente, Nome do Cliente, Código da Cidade, Nome da Cidade, UF).
DROP VIEW IF EXISTS VW_FilmesAlocadosEmMG;
CREATE OR REPLACE VIEW VW_FilmesAlocadosEmMG AS
    SELECT 
        f.codfilme AS codigo_filme,
        f.nome AS filme,
        loc.datalocacao AS data_locacao,
        loc.datadevolucao AS data_devolucao,
        cli.codcliente AS cod_cliente,
        cli.nome AS cliente,
        cid.nome AS cidade,
        cid.uf AS uf
    FROM
        cliente cli
    JOIN cidade cid ON cli.codcidadereside = cid.codcidade
    JOIN locacao loc ON loc.codcliente = cli.codcliente
    JOIN filme f ON f.codfilme = loc.codfilme
    WHERE
        cid.uf = 'MG'
        AND loc.statuslocacao = 'E'
    ORDER BY loc.datalocacao DESC;