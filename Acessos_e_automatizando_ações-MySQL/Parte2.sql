-- Gatilho "before delete" para evitar a exclusão de informações de usuários
DELIMITER //
CREATE TRIGGER before_delete_user
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO log_usuarios_excluidos (UserID, DataExclusao)
    VALUES (OLD.UserID, NOW());
END;
//

-- Gatilho "before update" para registrar a atualização de salário de empregados
DELIMITER //
CREATE TRIGGER before_update_salario
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.Salary <> OLD.Salary THEN
        INSERT INTO registro_atualizacao_salario (EmpID, NovoSalario, DataAtualizacao)
        VALUES (OLD.EmployeeID, NEW.Salary, NOW());
    END IF;
END;
//
DELIMITER ;
