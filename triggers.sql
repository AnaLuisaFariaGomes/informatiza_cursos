/* Crie um trigger que verifique se o CPF do aluno já está cadastrado no sistema.
 Não é permitido um mesmo CPF matriculado em mais de DOIS cursos completos ao mesmo tempo. 
 Se o aluno já estiver matriculado em dois cursos completos, o sistema não deve permitir que ele se matricule
 em um novo curso até que conclua. */
  -- 1) Criação de uma Trigger que verifica alunos matriculados em cursos pelo Cpf
 /*DELIMITER //
 CREATE TRIGGER tr_verifica_cpf BEFORE INSERT ON aluno
 FOR EACH ROW 
 BEGIN
 @qtd INT;
 IF(NEW.cpf != OLD.cpf) THEN*/

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
