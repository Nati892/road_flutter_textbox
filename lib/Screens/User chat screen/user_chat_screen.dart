import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  //TODO: add param for chat.
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 final String route = "/userchat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Some chat screen"),
      ),
    );
  }
}
