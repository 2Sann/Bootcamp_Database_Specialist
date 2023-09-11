-- Desativar o autocommit
SET autocommit = 0;

-- Iniciar uma transação
START TRANSACTION;

-- Executar consultas e modificações de dados aqui
INSERT INTO tabela1 (coluna1, coluna2) VALUES (valor1, valor2);
UPDATE tabela2 SET coluna3 = novo_valor WHERE condição;
DELETE FROM tabela3 WHERE outra_condição;

-- Verificar se há erros ou fazer outras verificações necessárias
IF erro_ocorreu THEN
    -- Se houver um erro, fazer o rollback da transação
    ROLLBACK;
ELSE
    -- Caso contrário, confirmar a transação
    COMMIT;
END IF;

-- Restaurar o autocommit para o valor padrão
SET autocommit = 1;