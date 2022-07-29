import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Chat/chatVM.dart';
import 'package:firebase_learn/Message/message_model.dart';
import 'package:firebase_learn/Screens/User%20chat%20screen/message_view.dart';
import 'package:firebase_learn/Screens/User%20chat%20screen/user_chat_screen_args.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Bottom_Bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String route = "/userchat";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as UserChatScreenArgs; //get arguments

    return ChangeNotifierProvider(
      create: (context) =>
          ChatVM.withArgs(args.chatId, args.userId, args.otherUsedId, []),
      child: FutureBuilder(
          future: Firebase_queries()
              .GetAllMessagesInChat(FirebaseFirestore.instance, args.chatId),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case (ConnectionState.done):
                Provider.of<ChatVM>(context, listen: false)
                    .syncFromSnapshot(snapshot);
                return Scaffold(
                  appBar: AppBar(
                    title: Text("${args.chatId}"),
                  ),
                  //  bottomNavigationBar: BottomChatBar(),
                  body: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: Provider.of<ChatVM>(context, listen: true)
                                .chatMessages
                                .map((e) {
                              return MessageView(e);
                            }).toList(),
                          ),
                        ),
                        BottomChatBar()
                      ],
                    ),
                  ),
                );
                break;
              case (ConnectionState.none):
                return Scaffold(
                    appBar: AppBar(title: Text("${args.chatId}")),
                    body: Center(child: Text("No connection!")));
                break;
              case (ConnectionState.waiting):
                return Scaffold(
                    appBar: AppBar(title: Text("${args.chatId}")),
                    body: Center(child: Text("Loading data")));

                break;
              default:
                return Scaffold(
                    appBar: AppBar(title: Text("${args.chatId}")),
                    body: Center(child: Text("Somthing went wrong...")));

                break;
            }
          }),
    );
  }
}
