  -- 1) Criação de uma Trigger que verifica alunos matriculados em cursos pelo Cpf
 DELIMITER //
CREATE 
	TRIGGER tr_limite_matricula
BEFORE INSERT ON aluno_has_curso FOR EACH ROW
BEGIN
  SET @qtd_matriculas = (
    SELECT COUNT(*) 
    FROM aluno_has_curso 
    WHERE aluno_idaluno = NEW.aluno_idaluno
  );
  IF (@qtd_matriculas >= 2) THEN
    SET NEW.aluno_idaluno = NULL;
  END IF;
END //
DELIMITER ;
 -- 2) Criação e teste da Trigger que atualiza a data de modificação de um Aluno
CREATE TABLE data_modificacao (
    id_data INT PRIMARY KEY AUTO_INCREMENT,
    data DATE
);
 CREATE 
    TRIGGER  tr_atualiza_data_modificacao
 AFTER UPDATE ON aluno FOR EACH ROW 
    INSERT INTO data_modificacao (data) VALUES (NOW());
 START TRANSACTION;
 UPDATE aluno SET nome = "Teste" WHERE idaluno = 1;
 SELECT * FROM log;
 ROLLBACK;
 -- 3) Criação de uma Trigger que registra logs 
 CREATE TABLE log (
    idlog INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME DEFAULT NOW(),
    tabela_afetada VARCHAR(20)
);
 CREATE 
    TRIGGER  tr_log_update_aluno
 AFTER UPDATE ON aluno FOR EACH ROW 
    INSERT INTO log (data_hora , tabela_afetada) VALUES (NOW() , 'aluno');
CREATE 
    TRIGGER  tr_log_update_topico
 AFTER UPDATE ON topico FOR EACH ROW 
    INSERT INTO log (data_hora , tabela_afetada) VALUES (NOW() , 'topico');
  CREATE 
    TRIGGER  tr_log_update_curso
 AFTER UPDATE ON curso FOR EACH ROW 
    INSERT INTO log (data_hora , tabela_afetada) VALUES (NOW() , 'curso');
DELIMITER //
CREATE 
	TRIGGER tr_log_update_matricula
AFTER UPDATE ON aluno FOR EACH ROW
	IF(NEW.matricula != OLD.matricula) THEN
		INSERT INTO log (data_hora, tabela_afetada) VALUES (NOW(), 'aluno');
	END IF;
BEGIN //
DELIMITER ;
START TRANSACTION;
UPDATE curso SET nome = "teste" WHERE idcurso = 1;
ROLLBACK;
SELECT * FROM curso;
DROP DATABASE cursosdobaruio;
