use cursosdobaruio;

INSERT INTO aluno (data_nascimento, nome, matricula) VALUES
('2000-01-01', 'João', 1001),
('1999-05-12', 'Maria', 1002),
('2001-03-22', 'José', 1003),
('1998-07-30', 'Ana', 1004),
('2002-11-15', 'Lucas', 1005);

INSERT INTO curso (nome, semanas) VALUES
('Python Básico', '6'),
('Java Avançado', '10'),
('Front-End Web', '8'),
('Banco de Dados', '7'),
('Machine Learning', '12');

INSERT INTO step (descricao, curso_idcurso) VALUES
('Introdução ao curso', 1),
('Conceitos básicos', 1),
('Programação OO', 2),
('HTML/CSS', 3),
('Modelagem de dados', 4);

INSERT INTO instrutor (nome, cpf) VALUES
('Pedro', '123.456.789-00'),
('Juliana', '987.654.321-00'),
('Bruno', '456.789.123-00'),
('Fernanda', '789.123.456-00'),
('Eduardo', '321.654.987-00');

INSERT INTO topico (nome, conteudo, instrutor_idinstrutor) VALUES
('Sintaxe Python', 'Variáveis e tipos', 1),
('POO em Java', 'Classes e objetos', 2),
('HTML5', 'Tags básicas', 3),
('SQL', 'Comandos SELECT', 4),
('Redes Neurais', 'Introdução ao ML', 5);

INSERT INTO titulacao (nome) VALUES
('Mestre em Ciência da Computação'),
('Doutor em Engenharia'),
('Especialista em Dados'),
('Pós em Educação Digital'),
('MBA em Gestão de TI');

INSERT INTO titulacao_has_instrutor (titulacao_idtitulacao, instrutor_idinstrutor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO step_has_topico (step_idstep, topico_idtopico) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

INSERT INTO aluno_has_curso (aluno_idaluno, curso_idcurso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO step_has_aluno (step_idstep, aluno_idaluno) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

INSERT INTO topico_has_aluno (topico_idtopico, aluno_idaluno) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

select * from aluno;

