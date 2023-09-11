Neste projeto, eu criei um banco de dados do zero com base no esquema conceitual que desenvolvi durante o módulo de modelagem de banco de dados usando o modelo ER. O objetivo era criar um esquema lógico para uma oficina, abrangendo todos os aspectos, desde a estrutura até a implementação do banco de dados.

Primeiro, defini as tabelas necessárias para representar as entidades relacionadas à oficina. Aqui estão algumas delas:

"Cliente" para armazenar informações sobre os clientes da oficina, como nome, telefone e email.
"Veiculo" para detalhar os veículos dos clientes, incluindo marca, modelo, ano e uma referência ao cliente.
"Servico" para listar os serviços disponíveis na oficina, com descrição e preço.
"Peça" para registrar as peças utilizadas na oficina, com nome e preço.
"Funcionario" para manter informações sobre os funcionários, como nome e cargo.
"Agendamento" para registrar os agendamentos feitos pelos clientes, relacionando clientes, veículos, serviços e funcionários, além de data e hora.
"Fornecedor" para conter detalhes sobre os fornecedores da oficina, incluindo nome e CNPJ.
"Compra" para registrar as compras feitas pela oficina aos fornecedores, com data da compra e uma referência ao fornecedor.
"Estoque" para controlar o estoque de peças, incluindo a quantidade disponível e uma referência à peça correspondente.
Depois de criar as tabelas, desenvolvi consultas SQL para demonstrar como o banco de dados pode ser usado para recuperar informações relevantes. Algumas das consultas que criei incluem:

Consultas simples para recuperar informações, como nomes e telefones de clientes.
Consultas com cláusulas WHERE para aplicar filtros, como a recuperação de modelos de veículos com ano superior a 2015.
Expressões para calcular atributos derivados, como o preço de peças com impostos.
Consultas com ORDER BY para ordenar os dados, como listar funcionários por cargo.
Consultas com HAVING Statement para aplicar condições de filtro aos grupos, como encontrar serviços com mais de 3 agendamentos.
Junções entre tabelas para fornecer perspectivas complexas dos dados, como unir informações de clientes, veículos e serviços agendados.
Consultas para recuperar peças fornecidas por um fornecedor específico.
Consultas para listar as compras realizadas por um fornecedor específico.
Uma consulta para verificar o estoque atual de peças.