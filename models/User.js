const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const Message = require("./Message");

const Users = sequelize.define("Users", {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  name: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  username: {
    type: DataTypes.STRING(50),
    allowNull: false,
    unique: true,
  },
  password: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  role: {
    type: DataTypes.ENUM("student", "moderator"),
    allowNull: false,
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
}, {
  timestamps: false, 
  tableName: "users",
});

Users.hasMany(Message, { foreignKey: "user_id" });
Message.belongsTo(Users, { foreignKey: "user_id" });

module.exports = Users;