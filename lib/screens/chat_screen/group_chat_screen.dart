
import 'package:flutter/material.dart';

import '../../../models/message.dart';
import '../../models/player.dart';
import '../../widgets/TextInputField.dart';
import 'components/message_bubble.dart';


const Color backgroundColor = Color.fromRGBO(16, 13, 34, 1);


class GroupChatScreen extends StatefulWidget {
  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  TextEditingController _controller = TextEditingController();
  List <Message> messages = [
    Message(text: 'Hey everyone!', sender: samplePlayer3),
    Message(text: 'Hey How are you!', sender: samplePlayer2),
    Message(text: 'All good, thank you!', sender: samplePlayer),
  ];

  @override
  Widget build(BuildContext context) {
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
                   messages.map((message) => MessageBubble(message: message)).toList(),
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
                      messages.add(Message(text: _controller.text, sender: samplePlayer));
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


