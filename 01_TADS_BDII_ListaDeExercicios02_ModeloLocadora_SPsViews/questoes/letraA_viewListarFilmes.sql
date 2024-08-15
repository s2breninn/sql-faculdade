/* LETRA A
View01: Desenvolva uma view chamada de VW_ListaFilmes que imprima a relação completa
dos filmes e suas categorias (todos os campos originais das tabelas).*/
DROP VIEW IF EXISTS VW_ListaFilmes;
CREATE OR REPLACE VIEW VW_ListaFilmes AS
    SELECT 
        c.codcategoria AS codcategoria,
        f.codfilme AS codfilme,
        f.nome AS nome,
        f.anolancamento AS anolancamento
    FROM
        filme f
    JOIN categoria c ON f.codcategoria = c.codcategoria;