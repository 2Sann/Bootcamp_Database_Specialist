-- Criação de usuário gerente com acesso às informações de employee e departamento
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha_gerente';

-- Concede permissões ao usuário gerente
GRANT SELECT ON nome_do_banco_de_dados.employee TO 'gerente'@'localhost';
GRANT SELECT ON nome_do_banco_de_dados.departamento TO 'gerente'@'localhost';

-- Criação da view "Número de empregados por departamento e localidade"
CREATE VIEW v_num_empregados_por_dept_local AS
SELECT departamento.Nome AS Departamento, departamento.Localidade, COUNT(employee.EmployeeID) AS NumEmpregados
FROM departamento
LEFT JOIN employee ON departamento.DeptID = employee.DeptID
GROUP BY departamento.DeptID, departamento.Localidade;

-- Criação da view "Lista de departamentos e seus gerentes"
CREATE VIEW v_lista_departamentos_gerentes AS
SELECT departamento.Nome AS Departamento, gerente.Nome AS Gerente
FROM departamento
LEFT JOIN employee AS gerente ON departamento.GerenteID = gerente.EmployeeID;

-- Criação da view "Projetos com maior número de empregados"
CREATE VIEW v_projetos_maior_num_empregados AS
SELECT projeto.Nome AS Projeto, MAX(projeto.NumEmpregados) AS MaiorNumEmpregados
FROM projeto
GROUP BY projeto.ProjetoID
ORDER BY MaiorNumEmpregados DESC;

-- Criação da view "Lista de projetos, departamentos e gerentes"
CREATE VIEW v_lista_projetos_dept_gerentes AS
SELECT projeto.Nome AS Projeto, departamento.Nome AS Departamento, gerente.Nome AS Gerente
FROM projeto
LEFT JOIN departamento ON projeto.DeptID = departamento.DeptID
LEFT JOIN employee AS gerente ON departamento.GerenteID = gerente.EmployeeID;

-- Criação da view "Empregados com dependentes e status de gerente"
CREATE VIEW v_empregados_com_dependentes_e_gerentes AS
SELECT employee.Nome AS Empregado, IFNULL(dependentes.NumDependentes, 0) AS NumDependentes,
       CASE WHEN departamento.GerenteID IS NOT NULL THEN 'Sim' ELSE 'Não' END AS ÉGerente
FROM employee
LEFT JOIN (
    SELECT EmpID, COUNT(*) AS NumDependentes
    FROM dependente
    GROUP BY EmpID
) AS dependentes ON employee.EmployeeID = dependentes.EmpID
LEFT JOIN departamento ON employee.EmployeeID = departamento.GerenteID;
