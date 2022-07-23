import 'package:firebase_learn/Chat/chatVM.dart';
import 'package:firebase_learn/Message/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BottomChatBar extends StatefulWidget {
  const BottomChatBar({Key? key}) : super(key: key);

  @override
  State<BottomChatBar> createState() => _BottomChatBarState();
}

class _BottomChatBarState extends State<BottomChatBar> {
  late TextEditingController TFController;

  @override
  void initState() {
    TFController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    TFController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatVM>(context, listen: false);

    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: TFController,
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Message"),
            ),
          ),
          IconButton(
              onPressed: ()  {
                print("pressed send button");

                if (TFController.text.trim() != "") {
                   provider.addMessage(MessageData(
                      provider.userId,
                      provider.otherUsrId,
                      DateTime.now(),
                      false,
                      TFController.text,
                      ""));
                  TFController.text = "";
                }
              }, //clearing text field

              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
