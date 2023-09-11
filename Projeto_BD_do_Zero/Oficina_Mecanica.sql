-- Criação das tabelas
CREATE TABLE IF NOT EXISTS Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Veiculo (
    VeiculoID INT PRIMARY KEY,
    ClienteID INT,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Ano INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

CREATE TABLE IF NOT EXISTS Servico (
    ServicoID INT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Peça (
    PeçaID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Funcionario (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Agendamento (
    AgendamentoID INT PRIMARY KEY,
    ClienteID INT,
    VeiculoID INT,
    ServicoID INT,
    FuncionarioID INT,
    DataAgendamento DATE,
    HoraAgendamento TIME,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID),
    FOREIGN KEY (ServicoID) REFERENCES Servico(ServicoID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID)
);

CREATE TABLE IF NOT EXISTS Fornecedor (
    FornecedorID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Compra (
    CompraID INT PRIMARY KEY,
    FornecedorID INT,
    DataCompra DATE NOT NULL,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(FornecedorID)
);

CREATE TABLE IF NOT EXISTS Estoque (
    EstoqueID INT PRIMARY KEY,
    PeçaID INT,
    Quantidade INT NOT NULL,
    FOREIGN KEY (PeçaID) REFERENCES Peça(PeçaID)
);
