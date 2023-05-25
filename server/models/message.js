const mongoose = require("mongoose");
const playerSchema = require("./player");

const messageSchema = new mongoose.Schema({
  messageText: {
    type: String,
    trim: true,
  },
  sender: {
    type: playerSchema,
  },

});

module.exports = messageSchema;
