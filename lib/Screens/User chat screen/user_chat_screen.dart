import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Screens/User%20chat%20screen/user_chat_screen_args.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
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

    var a = Firebase_queries()
        .GetAllMessagesInChat(FirebaseFirestore.instance, args.chatId);
    return FutureBuilder(
        future: a,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case (ConnectionState.done):
              return Scaffold(
                appBar: AppBar(title: Text("${args.chatId}")),
                body: Center(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300),
                        child: ListView(
                          children: [Text("data"), Text("2")],
                        ),
                      ),
                      ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 300),
                          child: ListView.builder(
                              itemCount: snapshot.data.size,
                              itemBuilder: (BuildContext context, int index) {
                                print(
                                    "!!!!!!!!******no way*********!!!!!!!!!!!");
                                return Text(
                                    "${snapshot.data.docs[index]["MessageText"]}");
                              })),
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
                  body: Center(child: Text("Dont know...")));

              break;
          }
        });
  }
}
