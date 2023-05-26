import 'package:flutter/material.dart';
import 'package:mp_tictactoe/models/player.dart';

import '../models/message.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  List<String> _displayElement = ['', '', '', '', '', '', '', '', ''];
  int _filledBoxes = 0;
  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
    isMe: true,
  );

  // Player _player2 = Player(
  //   nickname: '',
  //   socketID: '',
  //   points: 0,
  //   playerType: 'O',
  //   isMe: false,
  // );

  Map<String, dynamic> get roomData => _roomData;
  List<String> get displayElements => _displayElement;
  int get filledBoxes => _filledBoxes;
  Player get thisPlayer => _player1;
  //Player get player2 => _player2;

  List <Message> messages = [];

  List<Player> players = [];



  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }


  //**************************************************************//
  void updatePlayer2(Map<String, dynamic> player2Data) {
   // _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElement[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }

  void setFilledBoxesTo0() {
    _filledBoxes = 0;
  }

  void updateMessages(Message newMessage)
  {
    messages.add(newMessage);
    debugPrint("new message was added");
    notifyListeners();
  }

  void updatePlayers(List<Player> updatedPlayersList)
  {
    players.clear();

    for (Player player in updatedPlayersList)
      {
        players.add(player);
        debugPrint(player.nickname);
      }
    debugPrint("new player was added");
    notifyListeners();
  }
}
