/*1- Crie uma stored procedure que, dado a matrícula de um aluno e o step/semana, matricule o aluno em todos os tópicos do step*/
use cursosDoBaruio;

DELIMITER //
CREATE PROCEDURE sp_matricula_topicos_por_step (
IN p_matricula INT(11),
IN p_idstep INT(11)
)
BEGIN
    INSERT INTO topico_has_aluno (topico_idtopico, aluno_idaluno)
    SELECT sht.topico_idtopico, a.idaluno
    FROM aluno AS a
    JOIN step_has_topico AS sht ON sht.step_idstep = p_idstep
    WHERE a.matricula = p_matricula
    AND NOT EXISTS (
        SELECT 1
        FROM topico_has_aluno AS tha
        WHERE tha.topico_idtopico = sht.topico_idtopico
        AND tha.aluno_idaluno = a.idaluno
    );
END //
DELIMITER ;

call sp_matricula_topicos_por_step(1004, 2);
select * from vw_mostra_alunos_matriculados;

/*2- Crie uma stored procedure que, passando a matrícula de um aluno, atualize suas informações de nome, data de nascimento e email.*/

DELIMITER //
CREATE PROCEDURE sp_atualiza_dados_aluno (
    IN p_matricula INT,
    IN p_novo_nome VARCHAR(100),
    IN p_nova_data DATE,
    IN p_novo_email VARCHAR(100)
)
BEGIN
    UPDATE aluno
    SET nome = p_novo_nome, 
        data_nascimento = p_nova_data,
        email = p_novo_email
    WHERE matricula = p_matricula;

    IF ROW_COUNT() = 0 THEN
        SELECT 'Matricula não encontrada' AS mensagem;
    ELSE
        SELECT 'Dados atualizados com sucesso' AS mensagem;
    END IF;
END //
DELIMITER ;
	
CALL sp_atualiza_dados_aluno(1004,'Ana L','2006-02-02', 'ana@gmail.com');
SELECT * FROM aluno;
