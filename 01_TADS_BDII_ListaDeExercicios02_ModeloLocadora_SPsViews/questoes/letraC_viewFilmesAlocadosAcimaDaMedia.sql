/* Letra C
 View03: Elabore uma view chamada VW_FilmesAlocadosAcimaDaMedia que apresente todos
os filmes alocados com seu valor de alocação superior à média geral lançados entre 2016 e 2018.
(campos da saída: Código do Filme, Nome do Filme, Data da Alocação, Valor da Alocação, Ano de
Lançamento).*/
DROP VIEW IF EXISTS VW_FilmesAlocadosAcimaDaMedia;
CREATE OR REPLACE VIEW VW_FilmesAlocadosAcimaDaMedia AS
    SELECT 
        f.codfilme AS codfilme,
        f.nome AS nome,
        l.datalocacao AS datalocacao,
        l.valorlocacao AS valorlocacao,
        f.anolancamento AS anolancamento,
        media.MediaValorAlocacao AS MediaValorAlocacao
    FROM
        filme f
    JOIN locacao l ON f.codfilme = l.codfilme
    JOIN (
        SELECT 
            AVG(valorlocacao) AS MediaValorAlocacao
        FROM locacao l
        JOIN filme f ON l.codfilme = f.codfilme
        WHERE f.anolancamento BETWEEN 2016 AND 2018
    ) media ON l.valorlocacao > media.MediaValorAlocacao
    WHERE
        f.anolancamento BETWEEN 2016 AND 2018;