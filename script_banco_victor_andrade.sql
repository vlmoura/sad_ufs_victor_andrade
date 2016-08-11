CREATE DATABASE sibi;

CREATE SEQUENCE public.funcionario_id_funcionario_seq;

CREATE TABLE public.funcionario (
                id_funcionario BIGINT NOT NULL DEFAULT nextval('public.funcionario_id_funcionario_seq'),
                matricula VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                dt_admissao DATE NOT NULL,
                dt_desligamento DATE,
                CONSTRAINT id_funcionario PRIMARY KEY (id_funcionario)
);


ALTER SEQUENCE public.funcionario_id_funcionario_seq OWNED BY public.funcionario.id_funcionario;

CREATE SEQUENCE public.emprestimo_id_emprestimo_seq_1;

CREATE TABLE public.emprestimo (
                id_emprestimo BIGINT NOT NULL DEFAULT nextval('public.emprestimo_id_emprestimo_seq_1'),
                id_funcionario BIGINT NOT NULL,
                dt_emprestimo DATE NOT NULL,
                dt_prevista_devolucao DATE NOT NULL,
                CONSTRAINT id_emprestimo PRIMARY KEY (id_emprestimo)
);


ALTER SEQUENCE public.emprestimo_id_emprestimo_seq_1 OWNED BY public.emprestimo.id_emprestimo;

CREATE TABLE public.renovacao (
                id_emprestimo BIGINT NOT NULL,
                dt_renovacao DATE NOT NULL,
                CONSTRAINT id_renovacao PRIMARY KEY (id_emprestimo)
);


CREATE TABLE public.devolucao (
                id_emprestimo BIGINT NOT NULL,
                dt_devolucao DATE,
                vl_multa NUMERIC(5,2),
                CONSTRAINT id_devolucao PRIMARY KEY (id_emprestimo)
);


CREATE SEQUENCE public.usuario_id_usuario_seq_1;

CREATE TABLE public.usuario (
                id_usuario BIGINT NOT NULL DEFAULT nextval('public.usuario_id_usuario_seq_1'),
                matricula VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT id_usuario PRIMARY KEY (id_usuario)
);


ALTER SEQUENCE public.usuario_id_usuario_seq_1 OWNED BY public.usuario.id_usuario;

CREATE SEQUENCE public.reserva_id_reserva_seq;

CREATE TABLE public.reserva (
                id_reserva BIGINT NOT NULL DEFAULT nextval('public.reserva_id_reserva_seq'),
                id_usuario BIGINT NOT NULL,
                id_emprestimo BIGINT NOT NULL,
                dt_limite_reserva DATE NOT NULL,
                CONSTRAINT id_reserva PRIMARY KEY (id_reserva)
);


ALTER SEQUENCE public.reserva_id_reserva_seq OWNED BY public.reserva.id_reserva;

CREATE TABLE public.assunto (
                id_assunto BIGINT NOT NULL,
                descricao VARCHAR NOT NULL,
                CONSTRAINT id_assunto PRIMARY KEY (id_assunto)
);


CREATE SEQUENCE public.editora_id_editora_seq_1;

CREATE TABLE public.editora (
                id_editora BIGINT NOT NULL DEFAULT nextval('public.editora_id_editora_seq_1'),
                nome VARCHAR NOT NULL,
                CONSTRAINT id_editora PRIMARY KEY (id_editora)
);


ALTER SEQUENCE public.editora_id_editora_seq_1 OWNED BY public.editora.id_editora;

CREATE TABLE public.Auto (
                ID BIGINT NOT NULL,
                Nome VARCHAR NOT NULL,
                CONSTRAINT id_autor PRIMARY KEY (ID)
);


CREATE TABLE public.livro (
                id_livro BIGINT NOT NULL,
                id_assunto BIGINT NOT NULL,
                id_editora BIGINT NOT NULL,
                ID BIGINT NOT NULL,
                titulo VARCHAR NOT NULL,
                dt_ano_lancamento DATE NOT NULL,
                isbn VARCHAR NOT NULL,
                saldo INTEGER NOT NULL,
                CONSTRAINT id_livro PRIMARY KEY (id_livro)
);


CREATE TABLE public.emprestimo_detalhe (
                id_emprestimo BIGINT NOT NULL,
                id_livro BIGINT NOT NULL,
                CONSTRAINT id_emprestimo_detalhe PRIMARY KEY (id_emprestimo, id_livro)
);


ALTER TABLE public.emprestimo ADD CONSTRAINT funcionario_emprestimo_fk
FOREIGN KEY (id_funcionario)
REFERENCES public.funcionario (id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reserva ADD CONSTRAINT emprestimo_reserva_fk
FOREIGN KEY (id_emprestimo)
REFERENCES public.emprestimo (id_emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.emprestimo_detalhe ADD CONSTRAINT emprestimo_emprestimo_detalhe_fk
FOREIGN KEY (id_emprestimo)
REFERENCES public.emprestimo (id_emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.devolucao ADD CONSTRAINT emprestimo_devolucao_fk
FOREIGN KEY (id_emprestimo)
REFERENCES public.emprestimo (id_emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.renovacao ADD CONSTRAINT emprestimo_renovacao_fk
FOREIGN KEY (id_emprestimo)
REFERENCES public.emprestimo (id_emprestimo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reserva ADD CONSTRAINT usuario_reserva_fk
FOREIGN KEY (id_usuario)
REFERENCES public.usuario (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livro ADD CONSTRAINT assunto_livro_fk
FOREIGN KEY (id_assunto)
REFERENCES public.assunto (id_assunto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livro ADD CONSTRAINT editora_livro_fk
FOREIGN KEY (id_editora)
REFERENCES public.editora (id_editora)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livro ADD CONSTRAINT auto_livro_fk
FOREIGN KEY (ID)
REFERENCES public.Auto (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.emprestimo_detalhe ADD CONSTRAINT livro_emprestimo_detalhe_fk
FOREIGN KEY (id_livro)
REFERENCES public.livro (id_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
