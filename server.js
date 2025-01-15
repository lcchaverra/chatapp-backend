require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const swaggerUi = require("swagger-ui-express");
const swaggerSpec = require("./swagger");
const cors = require("cors");
const port = process.env.PORT || 3000;
const authRoutes = require("./routes/auth");
const messageRoutes = require("./routes/message");
const sequelize = require("./config/database");
const app = express();
const http = require('http');
const server = http.createServer(app);
const socketIO = require('./socket');

const io = socketIO.init(server);

io.on('connection', (socket) => {
  console.log('Nuevo cliente conectado');
  
  socket.on('disconnect', () => {
    console.log('Cliente desconectado');
  });
});

app.use(bodyParser.json());

// configuracion de cors
app.use(cors({origin: "*",
  methods: ["GET", "POST"],
  credentials: true
}));

// Configuración de Swagger
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Rutas
app.use("/auth", authRoutes);
app.use("/messages", messageRoutes);

// Conexión a la base de datos y servidor
sequelize
  .sync()
  .then(() => {
    app.listen(port, () => {
      console.log(`Servidor corriendo en http://localhost:${port}`);
      console.log(`Servidor corriendo en http://localhost:${port}/api-docs`);
      console.log("Conectado a la base de datos MySQL");
    });
  })
  .catch((err) => {
    console.error("Error al conectar a MySQL:", err.message);
  });
