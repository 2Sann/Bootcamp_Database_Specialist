-- Parte 2: Utilização de Procedures para Manipulação de Dados em Banco de Dados

-- Criação da Procedure
DELIMITER //

CREATE PROCEDURE ManipularDados(
    IN acao INT,
    IN tabela VARCHAR(255),
    IN registro_id INT,
    IN novo_valor VARCHAR(255)
)
BEGIN
    CASE acao
        WHEN 1 THEN
            -- SELECT
            IF tabela = 'departamentos' THEN
                SELECT * FROM departamentos WHERE id = registro_id;
            ELSEIF tabela = 'empregados' THEN
                SELECT * FROM empregados WHERE id = registro_id;
            ELSEIF tabela = 'produtos' THEN
                SELECT * FROM produtos WHERE id = registro_id;
            ELSE
                SELECT 'Tabela não reconhecida.';
            END IF;
        WHEN 2 THEN
            -- UPDATE
            IF tabela = 'departamentos' THEN
                UPDATE departamentos SET nome = novo_valor WHERE id = registro_id;
            ELSEIF tabela = 'empregados' THEN
                UPDATE empregados SET sobrenome = novo_valor WHERE id = registro_id;
            ELSEIF tabela = 'produtos' THEN
                UPDATE produtos SET descricao = novo_valor WHERE id = registro_id;
            ELSE
                SELECT 'Tabela não reconhecida.';
            END IF;
        WHEN 3 THEN
            -- DELETE
            IF tabela = 'departamentos' THEN
                DELETE FROM departamentos WHERE id = registro_id;
            ELSEIF tabela = 'empregados' THEN
                DELETE FROM empregados WHERE id = registro_id;
            ELSEIF tabela = 'produtos' THEN
                DELETE FROM produtos WHERE id = registro_id;
            ELSE
                SELECT 'Tabela não reconhecida.';
            END IF;
        ELSE
            SELECT 'Ação não reconhecida.';
    END CASE;
END;
//

DELIMITER ;
