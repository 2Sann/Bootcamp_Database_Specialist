-- Recuperação simples com SELECT Statement
SELECT Nome, Telefone FROM Cliente;

-- Filtros com WHERE Statement
SELECT Nome, Modelo FROM Veiculo WHERE Ano > 2015;

-- Expressões para gerar atributos derivados
SELECT Nome, Preco * 1.1 AS PrecoComImposto FROM Peça;

-- Ordenação dos dados com ORDER BY
SELECT Nome, Cargo FROM Funcionario ORDER BY Cargo ASC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT ServicoID, COUNT(*) AS TotalAgendamentos
FROM Agendamento
GROUP BY ServicoID
HAVING COUNT(*) > 3;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT Cliente.Nome, Veiculo.Marca, Servico.Descricao
FROM Cliente
JOIN Veiculo ON Cliente.ClienteID = Veiculo.ClienteID
JOIN Agendamento ON Veiculo.VeiculoID = Agendamento.VeiculoID
JOIN Servico ON Agendamento.ServicoID = Servico.ServicoID;

-- Recuperação de peças fornecidas por um fornecedor específico
SELECT Peça.Nome, Fornecedor.Nome AS Fornecedor
FROM Peça
JOIN Fornecedor_Peça ON Peça.PeçaID = Fornecedor_Peça.PeçaID
JOIN Fornecedor ON Fornecedor_Peça.FornecedorID = Fornecedor.FornecedorID
WHERE Fornecedor.Nome = 'Nome do Fornecedor';

-- Recuperação das compras realizadas por um fornecedor
SELECT Compra.CompraID, Compra.DataCompra, Peça.Nome AS Peça
FROM Compra
JOIN Compra_Peça ON Compra.CompraID = Compra_Peça.CompraID
JOIN Peça ON Compra_Peça.PeçaID = Peça.PeçaID
WHERE Compra.FornecedorID = 1;

-- Consulta para verificar o estoque atual de peças
SELECT Peça.Nome, Estoque.Quantidade
FROM Peça
JOIN Estoque ON Peça.PeçaID = Estoque.PeçaID;
