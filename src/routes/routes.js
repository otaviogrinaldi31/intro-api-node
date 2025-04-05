const express = require('express');
const router = express.Router();

const NotificacaoController = require('../controllers/notificacao');

router.get('/notificacao', NotificacaoController.listarnotificacao);
router.post('/notificacao', NotificacaoController.cadrastonotificacao);
router.patch('/notificacao', NotificacaoController.editarnotificacao);
router.delete('/notificacao', NotificacaoController.apagarnotificacao);

module.exports = router;