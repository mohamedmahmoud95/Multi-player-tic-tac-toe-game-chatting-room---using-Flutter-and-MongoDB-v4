const mongoose = require("mongoose");

const playerSchema = new mongoose.Schema({
  nickname: {
    type: String,
    trim: true,
  },
  socketID: {
    type: String,
  },
  points: {
    type: Number,
    default: 0,
  },
  playerType: {
    required: true,
    type: String,
  },


  top: {
    type: Number,
    default: 500,
  },
  left: {
    type: Number,
    default: 150,
  },


  score: {
    type: Number,
    default: 0,
  },

   playerNo: {
     type: Number,
     default: 1,
   },

   isMe:{
     type: Boolean,
     required: true,
     default: false,
   },

});

module.exports = playerSchema;
