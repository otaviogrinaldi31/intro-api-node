-- Comdominio
SELECT cond_id, cond_nome, cond_endereco, cond_cidade FROM Condominio;

-- Bloco
SELECT bloc_id, cond_id, bloc_nome FROM bloco;

-- Apartamentos
SELECT bloco_id, ap_numero, ap_andar FROM Apartamentos;

-- Usuarios
SELECT user_id, user_nome, user_email, user_senha, user_telefone, user_tipo from usuarios;

-- Usuario_Apartamentos
SELECT userid, ap_id FROM Usuario_Apartamentos;

-- Gerenciamento
SELECT ger_id, cond_id, ger_data, ger_descricao, ger_valor FROM Gerenciamento;

-- Mensagens
SELECT msg_id, cond_id, userap_id msg_mensagem, msg_data_envio msg_status FROM Mensagens;

-- Ambientes
SELECT cond_id, amb_descricao, amb_Nome, amb_capacidade FROM Ambientes;

-- Reservas_Ambientes
SELECT res_id, userap_id, ambiid, res_horario_inicio, res_horario_fim, res_status, res_data_reserva FROM Reservas_Ambientes;

-- Visitantes
SELECT vst_nome, vst_documento, AP_id, vst_data_visita FROM Visitantes;

-- Notificacoes
SELECT not_id, userAP_id, not_mensagem, not_data_envio, not_lida FROM Notificacoes;