const bd = require('../database/connection');

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
         return response.status(200).json({
                sucesso: true,
                nmensagem: 'Cadrasto notificação.',
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
