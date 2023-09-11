Parte 1 - Transações:

Para começar, desabilitei o autocommit no MySQL para garantir que cada instrução SQL não fosse confirmada automaticamente após a execução. Em seguida, iniciei uma transação com o comando START TRANSACTION. Dentro dessa transação, executei consultas e modificações de dados, como inserções, atualizações e exclusões, conforme necessário. Adicionei uma verificação de erro usando um bloco IF para identificar problemas durante a transação. Se um erro ocorresse, acionaria um ROLLBACK para desfazer as alterações. Caso contrário, confirmaria a transação usando COMMIT.

Parte 2 - Transação com Procedure:

Na segunda parte, criei uma procedure chamada MinhaProcedure(). Esta procedure foi projetada para encapsular uma transação. Para lidar com erros, estabeleci um manipulador de exceção DECLARE EXIT HANDLER FOR SQLEXCEPTION. Dentro da procedure, iniciei uma transação com START TRANSACTION, executei consultas e modificações de dados e implementei a mesma verificação de erro vista na parte 1. Se ocorresse um erro, acionaria um ROLLBACK. Se não, confirmaria a transação com COMMIT. Isso tornou a lógica da transação reutilizável e encapsulada na procedure.

Parte 3 - Backup e Recovery:

Na terceira parte, realizei o backup e a recuperação do banco de dados "e-commerce". Para fazer o backup, utilizei a ferramenta mysqldump. Com um único comando mysqldump, exportei tanto a estrutura do banco de dados quanto os dados para um arquivo chamado "backup.sql". Para restaurar o banco de dados a partir do backup, executei um comando mysql e forneci o arquivo "backup.sql" como entrada. Isso resultou na recriação do banco de dados e na inserção dos dados a partir do arquivo de backup.