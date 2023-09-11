DELIMITER //

CREATE PROCEDURE MinhaProcedure()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Se ocorrer um erro, fazer o rollback da transação
        ROLLBACK;
    END;

    -- Iniciar a transação
    START TRANSACTION;

    -- Executar consultas e modificações de dados aqui
    INSERT INTO tabela1 (coluna1, coluna2) VALUES (valor1, valor2);
    UPDATE tabela2 SET coluna3 = novo_valor WHERE condição;
    DELETE FROM tabela3 WHERE outra_condição;

    -- Confirmar a transação
    COMMIT;
END //

DELIMITER ;
