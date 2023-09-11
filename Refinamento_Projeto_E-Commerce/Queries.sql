-- Inserir um novo produto
INSERT INTO Produto (idProduto, Nome, Categoria, Descrição, Valor, Garantia)
VALUES (1, 'Produto1', 'Categoria1', 'Descrição1', 19.99, 'Garantia1');

-- Inserir um novo cliente
INSERT INTO Cliente (idCliente, Nome, E-mail, `Telefone 1`, `Telefone 2`, `CPF/CNPJ`, `Data de Nascimento`, Endereço, Tipo)
VALUES (1, 'Nome do Cliente', 'cliente@email.com', 1234567890, NULL, '12345678901', '2000-01-01', 'Endereço do Cliente', 'PF');

-- Atualizar o status de um pedido com base no ID do pedido (por exemplo, ID do pedido 1)
UPDATE Pedido
SET `Status do pedido` = 'Novo Status'
WHERE idPedido = 1;

-- Recuperar todos os produtos de uma categoria específica (por exemplo, 'Categoria1')
SELECT * FROM Produto
WHERE Categoria = 'Categoria1';

-- Recuperar todos os produtos disponíveis em um estoque específico (por exemplo, Estoque com ID 1)
SELECT p.*
FROM Produto p
JOIN `Produto Disponivel em Estoque` pe ON p.idProduto = pe.Produto_idProduto
WHERE pe.Estoque_idEstoque = 1;

-- Excluir um cliente com base no ID do cliente (por exemplo, ID do cliente 1)
DELETE FROM Cliente
WHERE idCliente = 1;

-- Consultas relacionadas a Produtos:

-- a. Recuperar todos os produtos de uma categoria específica
SELECT * FROM Produto
WHERE Categoria = 'Categoria1';

-- b. Encontrar o produto com o valor mais alto
SELECT * FROM Produto
ORDER BY Valor DESC
LIMIT 1;

-- Consultas relacionadas a Clientes:

-- a. Encontrar todos os clientes com telefone de contato secundário nulo
SELECT * FROM Cliente
WHERE `Telefone 2` IS NULL;

-- b. Recuperar todos os clientes com idade superior a 30 anos
SELECT * FROM Cliente
WHERE `Data de Nascimento` <= CURDATE() - INTERVAL 30 YEAR;

-- Consultas relacionadas a Pedidos:

-- a. Recuperar todos os pedidos com um status específico
SELECT * FROM Pedido
WHERE `Status do pedido` = 'Status1';

-- b. Encontrar o número total de pedidos feitos
SELECT COUNT(*) AS TotalPedidos FROM Pedido;

-- Consultas relacionadas a Estoque:

-- a. Recuperar o estoque responsável por um determinado produto
SELECT e.Local, e.Responsavel
FROM Estoque e
JOIN `Produto Disponivel em Estoque` pe ON e.idEstoque = pe.Estoque_idEstoque
WHERE pe.Produto_idProduto = 1;

-- b. Encontrar todos os estoques com mais de 100 unidades de um produto específico
SELECT e.idEstoque, e.Local
FROM Estoque e
JOIN `Produto Disponivel em Estoque` pe ON e.idEstoque = pe.Estoque_idEstoque
WHERE pe.Produto_idProduto = 1 AND pe.Quantidade > 100;
