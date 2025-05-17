const db = require('../database/connection');

module.exports = {
    async listarnotificacao(request, response) {
        try {
            const sql = `SELECT not_id, userap_id, not_mensagem, not_data_envio, not_lida FROM notificacoes`;
            const [rows] = await db.query(sql);

            return response.status(200).json({
                sucesso: true,
                nmensagem: 'Lista de notificações.',
                nItens: rows.length,
                dados: rows
            });
        } catch (error) {
            return response.status(500).json({
                sucesso: false,
                nmensagem: 'Erro ao listar notificações.',
                dados: error.message
            });
        }
    },

    async cadrastonotificacao(request, response) {
        try {
            const { Userap_ID, notificacaoMensagem, NotDataEnvio, notificacaoLida } = request.body;

            // Verifica se o Userap_ID existe na tabela usuario_apartamento
            const [usuario] = await db.query('SELECT * FROM usuario_apartamento WHERE userap_id = ?', [Userap_ID]);
            if (usuario.length === 0) {
                return response.status(400).json({
                    sucesso: false,
                    nmensagem: 'Usuário/apartamento não encontrado.',
                    dados: null
                });
            }

            const sql = `
                INSERT INTO notificacoes 
                (userap_id, not_mensagem, not_data_envio, not_lida)
                VALUES (?, ?, ?, ?)
            `;
            const values = [Userap_ID, notificacaoMensagem, NotDataEnvio, notificacaoLida];

            const [result] = await db.query(sql, values);

            return response.status(200).json({
                sucesso: true,
                nmensagem: 'Cadastro de notificação realizado com sucesso.',
                dados: {
                    id: result.insertId,
                    Userap_ID,
                    notificacaoMensagem,
                    NotDataEnvio,
                    notificacaoLida
                }
            });
        } catch (error) {
            return response.status(500).json({
                sucesso: false,
                nmensagem: 'Erro ao cadastrar notificação.',
                dados: error.message
            });
        }
    },

    async editarnotificacao(request, response) {
        try {
            const { Userap_ID, notificacaoMensagem, NotDataEnvio, notificacaoLida } = request.body;
            const { id } = request.params;

            const sql = `
                UPDATE notificacoes
                SET userap_id = ?, not_mensagem = ?, not_data_envio = ?, not_lida = ?
                WHERE not_id = ?
            `;
            const values = [Userap_ID, notificacaoMensagem, NotDataEnvio, notificacaoLida, id];
            const [result] = await db.query(sql, values);

            return response.status(200).json({
                sucesso: true,
                nmensagem: `Notificação ${id} atualizada com sucesso.`,
                dados: result.affectedRows
            });
        } catch (error) {
            return response.status(500).json({
                sucesso: false,
                nmensagem: 'Erro ao editar notificação.',
                dados: error.message
            });
        }
    },

    async apagarnotificacao(request, response) {
        try {
            const { id } = request.params;
            const sql = `DELETE FROM notificacoes WHERE not_id = ?`;
            const values = [id];

            const [result] = await db.query(sql, values);

            if (result.affectedRows === 0) {
                return response.status(404).json({
                    sucesso: false,
                    nmensagem: `Notificação ${id} não encontrada.`,
                    dados: null
                });
            }

            return response.status(200).json({
                sucesso: true,
                nmensagem: `Notificação ${id} excluída com sucesso.`,
                dados: null
            });
        } catch (error) {
            return response.status(500).json({
                sucesso: false,
                nmensagem: 'Erro ao excluir notificação.',
                dados: error.message
            });
        }
    },
};