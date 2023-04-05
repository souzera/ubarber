create TABLE if not EXISTS usuarios(
	id serial PRIMARY key,
  	username varchar(32),
  	senha varchar(32),
  	url_avatar varchar(1024),
  	status bool
);

create TABLE if not exists clientes(
	id serial PRIMARY KEY,
  	nome varchar(255),
  	telefone varchar(32),
  	user_id int REFERENCES usuarios(id)
);

Alter TABLE clientes add if not exists status bool null;

CREATE table if not exists barbearias(
	id serial PRIMARY key,
	nome varchar(255),
  	whatsapp varchar(32),
  	local varchar(255),
  	horarios varchar(255),
	user_id int REFERENCES usuarios(id)
);

CREATE table if not exists atividades(
	id serial PRIMARY key,
  	cliente_id int REFERENCES clientes(ID),
  	barbearia_id int REFERENCES barbearias(ID)
);

ALTER TABLE atividades ADD if not exists data_atv date null;

SELECT * FROM clientes;