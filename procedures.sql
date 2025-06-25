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


-- Crie uma stored procedure que, passando o código de um curso, liste todas os tópicos de curso organizado por step;
delimiter #
create procedure sp_lista_topicos_por_curso(
in cursoId int
)
BEGIN
	select 
        s.descricao as "Descrição da step",
        t.nome as Topico,
        t.conteudo as "Conteudo tópico"
        
    from curso c
    join step s on s.curso_idcurso = c.idcurso
    join step_has_topico st on st.step_idstep = s.idstep
    join topico t on t.idtopico = st.topico_idtopico
    where c.idcurso = cursoId
    order by s.idstep, t.idtopico;
END#
delimiter ;  


-- Crie uma stored procedure que, dado o código de um tópico, apresente a relação de alunos matriculados neste tópico;
delimiter #
create procedure sp_lista_alunos_por_topico(
in p_idtopico int
)
BEGIN
    select 
        a.idaluno,
        a.nome as Aluno,
        a.matricula as Matricula,
        t.nome AS Topico
    from topico_has_aluno tha
    join aluno a on a.idaluno = tha.aluno_idaluno
    join topico t on t.idtopico = tha.topico_idtopico
    where t.idtopico = p_idtopico
    order by a.nome;
END#
DELIMITER ;


-- Crie uma nova stored procedure de sua escolha. 
delimiter #
create procedure sp_insere_instrutor(
in snome varchar(100),
in scpf varchar(45)
)
BEGIN
		if trim(snome) = '' then
			select "Cadastro não realizado, o nome do instrutor não foi passado corretamente";
        else
			insert into instrutor (nome, cpf)
			values (snome, scpf);
        end if;
END#
DELIMITER ;
