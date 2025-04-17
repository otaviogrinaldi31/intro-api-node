INSERT INTO condominio (cond_id, cond_nome, cond_endereco, cond_cidade) VALUES
(1, 'Condomínio Sol Nascente', 'Rua das Flores, 123', 'São Paulo'),
(2, 'Residencial Jardim Verde', 'Av. Central, 456', 'Curitiba'),
(3, 'Condomínio Vista Bela', 'Rua das Acácias, 789', 'Belo Horizonte'),
(4, 'Edifício Morada Nova', 'Av. Paulista, 1000', 'São Paulo');

INSERT INTO usuarios (userid, user_nome, user_email, user_senha, user_telefone, user_tipo) VALUES
(1, 'Ana Souza', 'ana.souza@email.com', 'senha123', '11999990001', 'morador'),
(2, 'Carlos Silva', 'carlos.silva@email.com', 'senha456', '11999990002', 'síndico'),
(3, 'Beatriz Lima', 'beatriz.lima@email.com', 'senha789', '11999990003', 'morador'),
(4, 'João Pedro', 'joao.pedro@email.com', 'senha321', '11999990004', 'administrador');

INSERT INTO gerenciamento (ger_id, cond_id, ger_data, ger_descricao, ger_valor) VALUES
(1, 1, '2024-01-10', 'Pagamento de energia', 1200.50),
(2, 2, '2024-02-05', 'Reparo no portão', 750.00),
(3, 3, '2024-03-15', 'Compra de materiais de limpeza', 340.75),
(4, 4, '2024-04-01', 'Reforma da fachada', 5000.00);

INSERT INTO bloco (bloc_id, cond_id, bloc_nome) VALUES
(1, 1, 'Bloco A'),
(2, 2, 'Bloco B'),
(3, 3, 'Bloco C'),
(4, 4, 'Bloco D');

INSERT INTO ambientes (amb_id, cond_id, amb_nome, amb_descricao, amb_capacidade) VALUES
(1, 1, 'Salão de Festas', 'Espaço para festas e eventos', 100),
(2, 2, 'Academia', 'Espaço com equipamentos de ginástica', 30),
(3, 3, 'Piscina', 'Piscina para uso dos moradores', 50),
(4, 4, 'Churrasqueira', 'Espaço com churrasqueira e mesas', 20);

INSERT INTO apartamentos (ap_id, bloc_id, ap_numero, ap_andar) VALUES
(1, 1, '101', 1),
(2, 2, '202', 2),
(3, 3, '303', 3),
(4, 4, '404', 4);

INSERT INTO visitantes (vst_id, ap_id, vst_nome, vst_documento, vst_data_visita) VALUES
(1, 1, 'Maria Clara', '123456789', '2024-04-01 14:30:00'),
(2, 2, 'Lucas Mendes', '987654321', '2024-04-02 16:45:00'),
(3, 3, 'Fernanda Costa', '456123789', '2024-04-03 11:20:00'),
(4, 4, 'Paulo Henrique', '321654987', '2024-04-04 10:00:00');

INSERT INTO usuario_apartamento (userap_id, userid, ap_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

INSERT INTO mensagens (msg_id, cond_id, userap_id, msg_mensagem, msg_data_envio, msg_status) VALUES
(1, 1, 1, 'Problema com a iluminação da garagem.', '2024-04-01 08:00:00', 'pendente'),
(2, 2, 2, 'Solicitação de poda das árvores.', '2024-04-02 09:15:00', 'resolvido'),
(3, 3, 3, 'Reclamação sobre barulho.', '2024-04-03 19:00:00', 'em análise'),
(4, 4, 4, 'Pedido de limpeza da piscina.', '2024-04-04 07:30:00', 'pendente');

INSERT INTO notificacoes (not_id, userap_id, not_mensagem, not_data_envio, not_lida) VALUES
(1, 1, 'Reunião de condomínio marcada para sábado.', '2024-04-01 12:00:00', FALSE),
(2, 2, 'Início da manutenção na área comum.', '2024-04-02 13:00:00', TRUE),
(3, 3, 'Falta de água programada.', '2024-04-03 14:00:00', FALSE),
(4, 4, 'Aviso sobre obras no entorno.', '2024-04-04 15:00:00', TRUE);

INSERT INTO reserva_ambientes (res_id, userap_id, amb_id, res_horario_inicio, res_horario_fim, res_status, res_data_reserva) VALUES
(1, 1, 1, '2024-04-10 10:00:00', '2024-04-10 14:00:00', 'confirmado', '2024-04-01 10:00:00'),
(2, 2, 2, '2024-04-11 08:00:00', '2024-04-11 10:00:00', 'pendente', '2024-04-02 11:00:00'),
(3, 3, 3, '2024-04-12 15:00:00', '2024-04-12 18:00:00', 'cancelado', '2024-04-03 12:00:00'),
(4, 4, 4, '2024-04-13 09:00:00', '2024-04-13 11:00:00', 'confirmado', '2024-04-04 13:00:00');