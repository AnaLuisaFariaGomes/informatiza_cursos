DELIMITER //
CREATE VIEW vw_mostra_alunos_matriculados AS
    SELECT 
        a.nome, t.nome, c.nome
    FROM
        aluno AS a,
        curso AS c,
        topico AS t
            JOIN
        aluno_has_curso AS ac ON ac.aluno_idaluno = a.idaluno
            AND ac.curso_idcurso = c.idcurso;
            JOIN
        topico_has_aluno AS ta ON ta.aluno_idaluno = a.idaluno
            AND ta.topico_idtopico = t.idtopico;
END //
DELIMITER ;
