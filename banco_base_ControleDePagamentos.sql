CREATE TABLE login(
  id serial NOT NULL,
  nome character varying(36) NOT NULL,
  senha character varying(36) NOT NULL,
  CONSTRAINT login_pkey PRIMARY KEY (id)
);

CREATE TABLE Categorias(
	id serial ,
	nome varchar(50),
	PRIMARY KEY (id)
);

CREATE TABLE Clientes(
	id serial,
	nome varchar(50),
  email varchar(50),
  fone varchar(50),
	PRIMARY KEY (id)
);

CREATE TABLE pagamentos(
  id serial NOT NULL,
  nome character varying(50),
  valor numeric(12,2),
  categoria integer,
  recorrencia character varying(50),
  cliente integer,
  datai character varying(50),
  dataf character varying(50),
  CONSTRAINT pagamentos_pkey PRIMARY KEY (id),
  CONSTRAINT pagamentos_categoria_fkey FOREIGN KEY (categoria)
      REFERENCES categorias (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT pagamentos_cliente_fkey FOREIGN KEY (cliente)
      REFERENCES clientes (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

/*LOGIN */

INSERT INTO login(nome, senha) VALUES ('admin', '123');

/*CATEGORIA */
INSERT INTO categorias(nome) VALUES ('Categoria 1');
INSERT INTO categorias(nome) VALUES ('Categoria 2');
INSERT INTO categorias(nome) VALUES ('Categoria 3');

/*CLIENTES */
INSERT INTO clientes(nome, email, fone)
VALUES ('Cliente 1', 'cliente1@email.com', '55 99990000');

INSERT INTO clientes(nome, email, fone)
VALUES ('Cliente 2', 'cliente2@email.com', '55 99990000');

INSERT INTO clientes(nome, email, fone)
VALUES ('Cliente 3', 'cliente2@email.com', '55 99990000');

/*PAGAMENTOS */
INSERT INTO pagamentos(nome, valor, categoria, recorrencia, cliente, datai, dataf)
VALUES ('Pagamento 1', '10', 1, 'Mensal', 1, '26/06/2016', '26/06/2017');

INSERT INTO pagamentos(nome, valor, categoria, recorrencia, cliente, datai, dataf)
VALUES ('Pagamento 2', '20', 2, 'Mensal', 2, '29/06/2016', '29/06/2017');
INSERT INTO pagamentos(nome, valor, categoria, recorrencia, cliente, datai, dataf)
VALUES ('Pagamento 3', '20', 3, 'Mensal', 3, '29/06/2016', '29/06/2017');
