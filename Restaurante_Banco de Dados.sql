-- Inserindo atendentes
INSERT INTO Atendente (matricula, nome, salario, matricula_responsavel) VALUES 
(101, 'João Silva', 2500.00, NULL), -- Atendente sênior (sem responsável)
(102, 'Maria Souza', 2200.00, 101), -- Subordinada de João
(103, 'Carlos Oliveira', 2300.00, 101); -- Subordinado de João

-- Inserindo telefones dos atendentes
INSERT INTO Telefone_Atendente (telefone, matricula_atendente) VALUES 
('(11) 9999-8888', 101),
('(11) 9777-6666', 101),
('(11) 9555-4444', 102),
('(11) 9333-2222', 103);

-- Inserindo mesas
INSERT INTO Mesa (numero) VALUES 
(10), (11), (12), (13), (14), (15);

-- Inserindo clientes (alguns sem CPF/info completas)
INSERT INTO Cliente (cpf, nome, endereco) VALUES 
('123.456.789-01', 'Ana Pereira', 'Rua A, 123'),
('987.654.321-09', 'Pedro Santos', 'Av. B, 456'),
(NULL, 'Cliente Não Identificado', NULL),
(NULL, NULL, NULL); -- Cliente totalmente anônimo

-- Inserindo itens do cardápio
INSERT INTO Item (codigo, nome, preco, tipo) VALUES 
(1, 'Filé Mignon', 89.90, 'PRATO'),
(2, 'Salada Caesar', 35.50, 'PRATO'),
(3, 'Sushi Variado', 65.00, 'PRATO'),
(4, 'Água Mineral', 8.00, 'BEBIDA'),
(5, 'Refrigerante', 10.00, 'BEBIDA'),
(6, 'Vinho Tinto', 120.00, 'BEBIDA');

-- Inserindo pedidos
INSERT INTO Pedido (hora_inicio, matricula_atendente, id_cliente, numero_mesa) VALUES 
('2023-05-01 19:30:00', 101, 1, 10),
('2023-05-01 20:15:00', 102, 2, 11),
('2023-05-01 20:30:00', 103, 3, 12);

-- Atualizando hora_fim para alguns pedidos (simulando pedidos finalizados)
UPDATE Pedido SET hora_fim = '2023-05-01 20:45:00' WHERE numero = 1;
UPDATE Pedido SET hora_fim = '2023-05-01 21:30:00' WHERE numero = 2;

-- Inserindo itens nos pedidos
INSERT INTO Item_Pedido (numero_pedido, codigo_item, quantidade) VALUES 
(1, 1, 2), -- Pedido 1: 2 Filés Mignon
(1, 6, 1), -- Pedido 1: 1 Vinho Tinto
(2, 2, 1), -- Pedido 2: 1 Salada Caesar
(2, 3, 1), -- Pedido 2: 1 Sushi Variado
(2, 5, 2), -- Pedido 2: 2 Refrigerantes
(3, 4, 1); -- Pedido 3: 1 Água Mineral