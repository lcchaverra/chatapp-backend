const express = require("express");
const router = express.Router();
const ControllerMessage = require("../controllers/Message");

/**
 * @swagger
 * /messages:
 *   post:
 *     summary: Enviar un nuevo mensaje
 *     tags: [Messages]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               user_id:
 *                 type: integer
 *               content:
 *                 type: string
 *     responses:
 *       201:
 *         description: Mensaje enviado exitosamente.
 *       400:
 *         description: Faltan datos requeridos.
 *       500:
 *         description: Error interno del servidor.
 */
router.post("/create", ControllerMessage.createMessage);

/**
 * @swagger
 * /messages:
 *   get:
 *     summary: Obtener todos los mensajes
 *     tags: [Messages]
 *     responses:
 *       200:
 *         description: Lista de mensajes.
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: integer
 *                   user_id:
 *                     type: integer
 *                   content:
 *                     type: string
 *                   created_at:
 *                     type: string
 *                     format: date-time
 */
router.get("/all", ControllerMessage.getMessages);

module.exports = router;
