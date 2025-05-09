const db = require('../database/connection');

module.exports = {
    async listarnotificacao (request, response){
        try{

            const sql = `SELECT not_id, userAP_id, not_mensagem, not_data_envio, not_lida FROM Notificacoes`;

            const [row] = await db.query(sql);
            const nItens = row.length;

         return response.status(200).json({
                sucesso: true,
                nmensagem: 'Lista de notificação.',
                nItens,
                dados: row
             })
        }catch (error){
            return response.status(550).json({
                sucesso: false,
                nmensagem: 'Erro na listagem de notificação.',
                dados: error.message
             });

        }
    },
    async cadrastonotificacao (request, response){
        try{
            const {Userap_ID, notificaçaoMensagem, NotDataEnvio, notificacaoLida} = request.body;
            const notificacaoID = 1;
            //Intrudoção SQL
         const sql = `
             INSERT INTO notificacoes 
            (userap_id, not_mensagem, not_data_envio, not_lida)
             VALUES
                (?,?,?,?)
             `;
            //definição dos dados a serem  inseridos em um array
            const values = [Userap_ID, notificaçaoMensagem, NotDataEnvio, notificacaoLida ];

            //Execução da intrução SQL passado os paremetros
            const [result] = await db.query(sql, values);

            //Inserindo o ID do registro inserido
            const dados = {
                id: result.insertId,
                Userap_ID,
                notificaçaoMensagem, 
                NotDataEnvio,
                notificacaoLida
            };

         return response.status(200).json({
                sucesso: true,
                nmensagem: 'Cadastro notificação.',
                dados: dados
             })
        }catch (error){
            return response.status(550).json({
                sucesso: false,
                nmensagem: 'Erro na listagem de notificação.',
                dados: error.message
             });

        }
    },
    async editarnotificacao (request, response){
        try{
            //parâmetros recebidos pelo corpo da requisição
            const {Userap_ID, notificaçaoMensagem, NotDataEnvio, notificacaoLida} = request.body;
            //parâmetro recebido pela URL via params ex: /notificacao/1
            const {id} = request.params;
            //Intrudoção SQL
            const sql = `UPDATE notificacoes
            SET userap_id = ?, not_mensagem = ?, not_data_envio = ?, not_lida = ?
            WHERE not_id = ?`;
            //preparo do array com os dados a serem atualizados
            const values = [Userap_ID, notificaçaoMensagem, NotDataEnvio, notificacaoLida, id];
            //Execução da obrenção de confirmação da atualização realizada
            const atualizaDados = await db.query(sql, values);

         return response.status(200).json({
                sucesso: true,
                nmensagem: `Notificação ${id} atualizado com sucesso.`,
                dados: atualizaDados[0].affectedRows
                //menSql: atualizaDados
             })
        }catch (error){
            return response.status(550).json({
                sucesso: false,
                nmensagem: 'Erro na listagem de notificação.',
                dados: error.message
             });

        }
    },
    async apagarnotificacao (request, response){
        try{
            //parâmetro passado via URL na chamada da API pelo frontend
            const {id} = request.params;
            //comando de exclusão
            const sql = `DELETE FROM notificacoes WHERE not_id = ?`;
            //array com parâmetro da exclusão
            const values = [id];
            //executa intrução no banco de dados
            const [result] = await db.query(sql, values);

            if (result.affectedRows === 0) {
                return res.status(404).json({
                    sucesso: false,
                    mensagem: `Notificação ${not_id} não encontrada.`,
                    dados: null
                });
            }
         return response.status(200).json({
                sucesso: true,
                nmensagem: `Notificação ${id} excluído com sucesso.`,
                dados: null
             });

        }catch (error){
            return response.status(550).json({
                sucesso: false,
                nmensagem: 'Erro na listagem de notificação.',
                dados: error.message
             });

        }
    },
}
