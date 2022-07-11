import 'package:firebase_learn/Chat/chat_data.dart';
import 'package:flutter/material.dart';

class ListChatItem extends StatelessWidget {
  const ListChatItem({Key? key, required this.Cdata}) : super(key: key);
  final ChatData Cdata;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
        child: GestureDetector(
          onTap: () {
            //when preesed only debugs
            print(
                "Pressed!! ${Cdata.ChatId} + ${Cdata.user1_Id} + ${Cdata.user2_id}");
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.cyan,
                border: Border.all(color: Colors.blueGrey),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Center(
                child: Text(
                    "${Cdata.ChatId} + ${Cdata.user1_Id} +${Cdata.user2_id}")),
          ),
        ));
  }
}
