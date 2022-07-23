import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Chat/chatVM.dart';
import 'package:firebase_learn/Message/message_model.dart';
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
  ChatVM? provider = null;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as UserChatScreenArgs; //get arguments

    var a = Firebase_queries()
        .GetAllMessagesInChat(FirebaseFirestore.instance, args.chatId);
    return FutureBuilder(
        future: a,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case (ConnectionState.done):
              return ChangeNotifierProvider(
                create: (context) => ChatVM.withArgs(
                    args.chatId, args.userId, args.otherUsedId, []),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("${args.chatId}"),
                  ),
                  bottomNavigationBar: BottomChatBar(),
                  body: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.78),
                            child: ListView.builder(
                                itemCount: snapshot.data.size,
                                itemBuilder: (BuildContext context, int index) {
                                  if (provider == null)
                                    provider = Provider.of<ChatVM>(context,
                                        listen: false);

                                  var FBmessageData = snapshot.data.docs[index];

                                  var currMSG = MessageData(
                                      FBmessageData["SenderId"],
                                      FBmessageData["ReceiverId"],
                                      FBmessageData["TimeSent"].toDate(),
                                      FBmessageData["Forworded"],
                                      FBmessageData["MessageText"],
                                      FBmessageData.id);
                                  print("Id: ${currMSG.MessageId} + ${index}");

                                  provider!.addMessageIninit(currMSG);

                                  return Text("${currMSG.MessageText}");
                                }),
                          ),
                        ),
                        // BottomChatBar()
                      ],
                    ),
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
