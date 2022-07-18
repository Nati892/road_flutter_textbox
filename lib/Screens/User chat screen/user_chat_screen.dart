import 'package:firebase_learn/Screens/User%20chat%20screen/user_chat_screen_args.dart';
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
    final args =
        ModalRoute.of(context)!.settings.arguments as UserChatScreenArgs;

    return Scaffold(
      body: Center(
        child: Text("${args.chatId}"),
      ),
    );
  }
}
