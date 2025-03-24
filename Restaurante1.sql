

CREATE TABLE Atendente (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    matricula_responsavel INT NULL, -- Atendente sênior (auto-relacionamento)
    CHECK (matricula BETWEEN 100 AND 999), -- Matrícula de 3 dígitos
    FOREIGN KEY (matricula_responsavel) REFERENCES Atendente(matricula)
);


CREATE TABLE Telefone_Atendente (
    telefone VARCHAR(20) PRIMARY KEY,
    matricula_atendente INT NOT NULL,
    FOREIGN KEY (matricula_atendente) REFERENCES Atendente(matricula)
);


CREATE TABLE Mesa (
    numero INT PRIMARY KEY,
    CHECK (numero BETWEEN 10 AND 99) -- Número de 2 dígitos
);


CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NULL, -- Pode ser NULL se não for fornecido
    nome VARCHAR(100) NULL, -- Pode ser NULL se não for fornecido
    endereco VARCHAR(200) NULL -- Pode ser NULL se não for fornecido
);


CREATE TABLE Item (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    tipo ENUM('PRATO', 'BEBIDA') NOT NULL
);


CREATE TABLE Pedido (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    hora_inicio DATETIME NOT NULL,
    hora_fim DATETIME NULL, -- Pode ser NULL se pedido ainda está em andamento
    duracao_segundos INT GENERATED ALWAYS AS (
        CASE 
            WHEN hora_fim IS NULL THEN NULL
            ELSE TIMESTAMPDIFF(SECOND, hora_inicio, hora_fim)
        END
    ) STORED,
    matricula_atendente INT NOT NULL,
    id_cliente INT NOT NULL,
    numero_mesa INT NOT NULL,
    FOREIGN KEY (matricula_atendente) REFERENCES Atendente(matricula),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY (numero_mesa) REFERENCES Mesa(numero)
);

CREATE TABLE Item_Pedido (
    numero_pedido INT,
    codigo_item INT,
    quantidade INT NOT NULL DEFAULT 1,
    PRIMARY KEY (numero_pedido, codigo_item),
    FOREIGN KEY (numero_pedido) REFERENCES Pedido(numero),
    FOREIGN KEY (codigo_item) REFERENCES Item(codigo)
);