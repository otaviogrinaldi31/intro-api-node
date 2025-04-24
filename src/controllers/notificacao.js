const db = require('../database/connection');

module.exports = {
    async listarnotificacao (request, response){
        try{

            const sql = `SELECT not_id, userAP_id, not_mensagem, not_data_envio, not_lida FROM Notificacoes`;

            const [row] = await bd.query(sql);
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
         return response.status(200).json({
                sucesso: true,
                nmensagem: 'Editar notificação.',
                dados: null
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
         return response.status(200).json({
                sucesso: true,
                nmensagem: 'Apagar notificação.',
                dados: null
             })
        }catch (error){
            return response.status(550).json({
                sucesso: false,
                nmensagem: 'Erro na listagem de notificação.',
                dados: error.message
             });

        }
    },
}
