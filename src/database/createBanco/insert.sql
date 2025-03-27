-- Inserts para as tabelas

-- Condominio
INSERT INTO Condominio (cond_nome, cond_endereco, cond_cidade) 
VALUES ('Condomínio Alpha', 'Rua A, 123', 'São Paulo');

-- Bloco
INSERT INTO Bloco (cond_id, bloc_nome) 
VALUES (1, 'Bloco A');

-- Apartamentos
INSERT INTO Apartamentos (bloco_id, ap_numero, ap_andar) 
VALUES (1, '101', 1);

-- Usuarios
INSERT INTO Usuarios (user_nome, user_email, user_senha, user_telefone, user_tipo) 
VALUES ('João Silva', 'joao@email.com', 'senha123', '11999999999', 'Morador');

-- Usuario_Apartamentos
INSERT INTO Usuario_Apartamentos (userid, ap_id) 
VALUES (1, 1);

-- Gerenciamento
INSERT INTO Gerenciamento (cond_id, ger_data, ger_descricao, ger_valor) 
VALUES (1, '2025-03-27', 'Manutenção Elevadores', 1500.00);

-- Mensagens
INSERT INTO Mensagens (cond_id, userap_id, msg_mensagem, msg_data_envio, msg_status) 
VALUES (1, 1, 'Bom dia, gostaria de relatar um problema.', NOW(), 'Enviado');

-- Ambientes
INSERT INTO Ambientes (cond_id, amd_descricao, amd_nome, amd_capacidade) 
VALUES (1, 'Salão de Festas', 'Salão Principal', 50);

-- Reservas_Ambientes
INSERT INTO Reservas_Ambientes (userap_id, ambiid, res_horario_inicio, res_horario_fim, res_status, res_data_reserva) 
VALUES (1, 1, '18:00:00', '22:00:00', 'Confirmado', '2025-04-10');

-- Visitantes
INSERT INTO Visitantes (vst_nome, vst_documento, ap_id, vst_data_visita) 
VALUES ('Carlos Souza', '123456789', 1, NOW());

-- Notificacoes
INSERT INTO Notificacoes (userAP_id, not_mensagem, not_data_envio, not_lida) 
VALUES (1, 'Sua reserva foi confirmada.', NOW(), FALSE);


