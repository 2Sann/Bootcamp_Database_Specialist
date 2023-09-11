Parte 1 - Personalização de Acessos com Views e Permissões:

Nesta parte do projeto, foram criadas visões (views) personalizadas no banco de dados MySQL para fornecer informações específicas a partir das tabelas existentes. As visões criadas incluem:

Número de Empregados por Departamento e Localidade: Esta view exibe o número de empregados por departamento e localidade. Ela utiliza uma junção entre as tabelas de departamento e employee para contar os empregados em cada departamento e localidade.

Lista de Departamentos e Seus Gerentes: Esta view lista os departamentos e os nomes de seus gerentes correspondentes. Os dados são obtidos por meio de uma junção entre as tabelas de departamento e employee (gerentes).

Projetos com Maior Número de Empregados: Esta view lista os projetos com o maior número de empregados, ordenados de forma decrescente com base na contagem de empregados em cada projeto.

Lista de Projetos, Departamentos e Gerentes: Esta view apresenta uma lista de projetos com seus departamentos e os nomes dos gerentes correspondentes. Utiliza junções entre as tabelas de projeto, departamento e employee.

Empregados com Dependentes e Status de Gerente: Esta view mostra quais empregados possuem dependentes e se são gerentes ou não. Ela combina informações das tabelas de employee e dependente, além de verificar se o empregado é gerente com base na tabela de departamento.

As permissões de acesso às views foram definidas de acordo com os requisitos do projeto. Um usuário chamado 'gerente' foi criado e recebeu permissão para acessar as informações de employee e departamento, enquanto o usuário 'employee' não tem acesso às informações relacionadas a departamentos ou gerentes.

Parte 2 - Criação de Gatilhos:

Nesta parte do projeto, foram criados gatilhos (triggers) no banco de dados MySQL para realizar ações em momentos específicos das operações no banco de dados. Os gatilhos criados incluem:

Gatilho Before Delete para Usuários: Este gatilho é acionado antes de excluir um registro da tabela de usuários. Ele registra o usuário excluído em uma tabela de log chamada log_usuarios_excluidos, juntamente com a data da exclusão. Isso é útil para rastrear as exclusões de usuários.

Gatilho Before Update para Salário de Empregados: Este gatilho é acionado antes de atualizar o salário de um empregado na tabela employee. Ele registra a atualização de salário em uma tabela de registro chamada registro_atualizacao_salario se o novo salário for diferente do salário anterior. Isso permite manter um histórico de atualizações salariais.