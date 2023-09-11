-- Parte 1: Criação de Índices em Banco de Dados

-- Consulta 1: Qual o departamento com maior número de pessoas?
-------------------------------------------------------------
SELECT 
    D.nome AS Departamento,
    COUNT(E.id) AS "Número de Empregados"
FROM
    departamentos D
INNER JOIN
    empregados E ON D.id = E.departamento_id
GROUP BY 
    D.nome
ORDER BY 
    COUNT(E.id) DESC
LIMIT 1;

-- Índice 1: Criação de índice na tabela empregados para o campo departamento_id.
CREATE INDEX idx_empregados_departamento ON empregados(departamento_id);

-- Consulta 2: Quais são os departamentos por cidade?
-----------------------------------------------------
SELECT
    D.nome AS Departamento,
    DL.cidade AS Cidade
FROM
    departamentos D
LEFT JOIN
    departamentos_cidades DL ON D.id = DL.departamento_id
ORDER BY
    DL.cidade;

-- Índice 2: Criação de índice na tabela departamentos para o campo id.
CREATE INDEX idx_departamentos_id ON departamentos(id);

-- Consulta 3: Relação de empregados por departamento.
-----------------------------------------------------
SELECT 
    CONCAT(E.primeiro_nome, " ", COALESCE(E.inicial_meio, ""), " ", E.sobrenome) AS Empregado,
    D.nome AS Departamento
FROM
    empregados E
LEFT JOIN
    departamentos D ON E.departamento_id = D.id
ORDER BY 
    D.nome, E.primeiro_nome, E.inicial_meio, E.sobrenome;

-- Índices 3: Criação de índices na tabela empregados para campos relevantes.
CREATE INDEX idx_empregados_nome_completo ON empregados(primeiro_nome, inicial_meio, sobrenome);

-- Consulta 4: Quais são os produtos mais vendidos?
---------------------------------------------------
SELECT 
    P.nome AS Produto,
    COUNT(PI.id) AS "Quantidade Vendida"
FROM
    produtos P
INNER JOIN
    pedidos_itens PI ON P.id = PI.produto_id
GROUP BY 
    P.nome
ORDER BY 
    COUNT(PI.id) DESC;

-- Índice 4: Criação de índice na tabela pedidos_itens para o campo produto_id.
CREATE INDEX idx_pedidos_itens_produto_id ON pedidos_itens(produto_id);

-- Consulta 5: Quais são os clientes mais ativos?
-------------------------------------------------
SELECT
    C.nome AS Cliente,
    C.ativo AS Ativo
FROM
    clientes C
ORDER BY
    C.ativo DESC, C.nome;

-- Índice 5: Criação de índice na tabela clientes para o campo ativo.
CREATE INDEX idx_clientes_ativo ON clientes(ativo);
