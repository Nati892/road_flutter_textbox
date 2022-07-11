import 'package:firebase_learn/Chat/chat_data.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatData> UserChats = [];//mock for the real dynamic deal, TODO: implement provider pattern
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Chats go here"),
      ),
    );
  }
}
