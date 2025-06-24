-- 1) View para mostrar alunos matriculados nos cursos e seus respectivos tópicos
CREATE VIEW vw_mostra_alunos_matriculados AS
    SELECT 
        a.nome AS nome_do_aluno,
        t.nome AS nome_do_topico,
        c.nome AS nome_do_curso
    FROM
        aluno AS a
            JOIN
        aluno_has_curso AS ac ON ac.aluno_idaluno = a.idaluno
            JOIN
        curso AS c ON ac.curso_idcurso = c.idcurso
            JOIN
        topico_has_aluno AS ta ON ta.aluno_idaluno = a.idaluno
            JOIN
        topico AS t ON ta.topico_idtopico = t.idtopico;
SELECT 
    *
FROM
    vw_mostra_alunos_matriculados;
-- 2) View para mostrar as titulações dos instrutores
CREATE VIEW vw_mostra_titulacao_dos_instrutores AS
    SELECT 
        t.nome AS nome_da_titulacao, i.nome AS nome_dos_instrutores
    FROM
        instrutor AS i
            JOIN
        titulacao_has_instrutor AS ti ON ti.instrutor_idinstrutor = i.idinstrutor
            JOIN
        titulacao AS t ON t.idtitulacao = ti.titulacao_idtitulacao;
SELECT 
    *
FROM
    vw_mostra_titulacao_dos_instrutores;
-- 3) View para mostrar as steps dos cursos
CREATE VIEW vw_mostra_step_do_curso AS
    SELECT 
        c.nome AS nome_do_curso, s.descricao AS descricao_das_steps
    FROM
        curso AS c
            JOIN
        step AS s ON s.curso_idcurso = c.idcurso;
SELECT 
    *
FROM
    vw_mostra_step_do_curso;
-- 4) View para mostrar instrutores dos cursos
CREATE VIEW vw_mostra_instrutor_do_curso AS
    SELECT 
        i.nome AS nome_do_instrutor, c.nome AS nome_do_curso
    FROM
        instrutor AS i
            JOIN
        topico AS t ON i.idinstrutor = t.instrutor_idinstrutor
            JOIN
        step_has_topico AS st ON st.topico_idtopico = t.idtopico
            JOIN
        step AS s ON st.step_idstep = s.idstep
            JOIN
        curso AS c ON c.idcurso = s.curso_idcurso;
SELECT 
    *
FROM
    vw_mostra_instrutor_do_curso;
-- 5) Mostra os alunos de maior idade para os mais novos
CREATE VIEW vw_mostra_alunos_por_idade AS
    SELECT 
        a.nome AS nome_do_aluno,
        TIMESTAMPDIFF(YEAR,
            a.data_nascimento,
            NOW()) AS idade_em_anos
    FROM
        aluno AS a
    ORDER BY data_nascimento ASC;
SELECT 
    *
FROM
    vw_mostra_alunos_por_idade;
