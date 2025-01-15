const sequelize = require("../config/database");
const Message = require("../models/Message");
const socketIO = require("../socket");

const ControllerMessage = {
    // Crear un nuevo mensaje
    createMessage: async (req, res) => {
      try {
        const { user_id, content } = req.body;
        if (!user_id || !content) {
            return res.status(400).json({ message: "Faltan datos requeridos." });
        }
        const newMessage = await Message.create({ user_id, content });
        const io = socketIO.getIO();
        io.emit('newMessage', newMessage);
        
        res.status(201).json({ message: "Mensaje enviado.", data: newMessage });
      } catch (error) {
        res.status(500).json({ error: error.message });
      }
    },
    
    // Obtener todos los mensajes
    getMessages: async (req, res) => {
      try {
        let query = `SELECT 
                        users.id AS user_id,
                        users.name AS user_name,
                        users.username AS user_username,
                        users.role AS user_role,
                        messages.id AS message_id,
                        messages.content AS message_content,
                        messages.is_moderator AS message_is_moderator,
                        messages.created_at AS message_created_at
                    FROM 
                        users
                    INNER JOIN 
                        messages ON users.id = messages.user_id
                        ORDER BY 
                      messages.created_at ASC;;` 
        // const Messages = await Message.findAll();
        const [result] = await sequelize.query(query);
        res.status(200).json(result);
      } catch (error) {
        res.status(500).json({ error: error.message });
      }
    },
}

module.exports = ControllerMessage;
