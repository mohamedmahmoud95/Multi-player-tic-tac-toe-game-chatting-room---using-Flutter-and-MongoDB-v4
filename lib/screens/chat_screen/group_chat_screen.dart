
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/src/socket.dart';

import '../../../models/message.dart';
import '../../models/player.dart';
import '../../provider/room_data_provider.dart';
import '../../resources/socket_client.dart';
import '../../resources/socket_methods.dart';
import '../../widgets/TextInputField.dart';
import 'components/message_bubble.dart';


const Color backgroundColor = Color.fromRGBO(16, 13, 34, 1);


class GroupChatScreen extends StatefulWidget {
  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  TextEditingController _controller = TextEditingController();
  //
  // final _socketClient = SocketClient.instance.socket!;
  // Socket get socketClient => _socketClient;
  final SocketMethods _socketMethods = SocketMethods();

  void addMessage (Message message, RoomDataProvider roomDataProvider)
  {
    _socketMethods.addMessage(message, roomDataProvider.roomData['_id'],);
  }


  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.messageAddedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: BackButton(onPressed: (){Navigator.of(context).pop();},),
        title: const Text('Chatting room'),
      ),
      body:  Column(
      children: [

            Expanded(
              child: ListView(
                   children:
                   roomDataProvider.messages.map((message) => MessageBubble(message: message)).toList(),
              ),
            ),

            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              color: backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Expanded(
                    child: TextInputField(hintText: 'Type a message', controller: _controller,),
                  ),
                  IconButton(
                    icon:  Icon(Icons.send, color: Colors.grey[350],),
                    onPressed: () {
                      setState(() {
                        Message newMessage = Message (text: _controller.text, sender: roomDataProvider.thisPlayer);
                        addMessage ( newMessage, roomDataProvider); //add to remote
                        roomDataProvider.messages.add(newMessage); //add to local
                      });
                    },
                  ),
                ],
              ),
            ),
            ],
          ),
    );
  }
}


