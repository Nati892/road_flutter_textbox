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
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,20,0,0),
                        child: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.85),
                            child: ListView.builder(
                                itemCount: snapshot.data.size,
                                itemBuilder: (BuildContext context, int index) {
                                  print(
                                      "!!!!!!!!******no way*********!!!!!!!!!!!");
                                  return Text(
                                      "${snapshot.data.docs[index]["MessageText"]}");
                                })),
                      ),
                      Expanded(
                          child: Container(
                        child: Row(
                          children: [
                            Expanded(child: ConstrainedBox(child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Message"),),constraints: BoxConstraints(maxWidth:400,maxHeight: 100 ),)),
                            
                            ],
                        ),
                      ))
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
