import 'package:firebase_learn/Message/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../Chat/chatVM.dart';

class MessageView extends StatelessWidget {
  const MessageView(this.msg, {Key? key}) : super(key: key);
  final MessageData msg;

  @override
  Widget build(BuildContext context) {
    var alignment = Alignment.centerLeft;
    var MsgColor = Colors.green;
    var provider = Provider.of<ChatVM>(context, listen: false);
    if (provider.userId != msg.SenderId) {
      alignment = Alignment.centerRight;
      MsgColor = Colors.blue;
    }
    return Align(
      child: Row(
        children: [
          if (alignment == Alignment.centerRight) Spacer(),
          Container(
            color: MsgColor,
            child: Align(
                alignment: alignment,
                child: Padding(
                  child: Column(
                    children: [
                      Text(msg.MessageText),
                      Row(
                        children: [
                          Text("${msg.TimeSent.hour}:${msg.TimeSent.minute}",style: TextStyle(fontSize: 6),),
                        ],
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(12.0),
                )),
          ),
          if (alignment != Alignment.centerRight) Spacer(),
        ],
      ),
    );
  }
}
