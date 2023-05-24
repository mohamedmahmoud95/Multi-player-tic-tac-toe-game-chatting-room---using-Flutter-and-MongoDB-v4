
import 'package:flutter/material.dart';

import '../../../../models/message.dart';
import '../../../constants/project_colors.dart';
import '../../../main.dart';
import '../../../models/player.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({required this.message});
  @override
  Widget build(BuildContext context) {
    bool isMe = (message.sender == samplePlayer);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [

          isMe?

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Expanded(
                flex: 1,
               child: SizedBox(width: MediaQuery.of(context).size.width/2,),),
          Expanded(
            flex: 1,
            child: Material(

              borderRadius: BorderRadius.circular(12.0),
              elevation: 4.0,
              color: isMe ? Colors.blue.shade900 : Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: Text(
                  message.text,
                  maxLines: 20,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: isMe ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
              const SizedBox(width: 10,),

          CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child:  Text(
              message.sender.nickname!,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
          ],
      )
              :
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children:[
                CircleAvatar(
                  backgroundColor: Colors.grey[350],
                  child: Text(
                    message.sender.nickname!,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: backgroundColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Material(
                  borderRadius: BorderRadius.circular(12.0),
                  elevation: 4.0,
                  color: isMe ? Colors.blue : Colors.grey[350],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isMe ? Colors.white : backgroundColor,
                      ),
                    ),
                  ),
                ),
              ]
          )
        ]
      )
    );
  }
}
