import 'package:mp_tictactoe/models/player.dart';

class Message{
  String text;
  Player sender;
  Message( {
    required this.text,
    required this.sender,
});
}