import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Chat/chat_model.dart';
import 'package:flutter/material.dart';

import '../../firebase_queries.dart';
import 'chatsScreenWidgets.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final String route = "/showallchats";

  final String DEBUG_USER_ID = "459rizMNZboZgo95EcIy";
  List<QueryDocumentSnapshot> set = [];

  @override
  Widget build(BuildContext context) {
    print("hiiiiii");
    return FutureBuilder(
      future: Firebase_queries().get_all_user_chats_collection(
          FirebaseFirestore.instance, DEBUG_USER_ID),
      initialData: set,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          set.addAll(snapshot.data);

          print("good: " + set.length.toString());
          return Scaffold(
            appBar: AppBar(title: Text("Chats")),
            body: Center(
              child: ListView.builder(
                itemCount: set.length,
                itemBuilder: (context, index) {
                  print("debug1: " + index.toString());
                  var i = set[index];
                  print("set size: " + set.length.toString());
                  var otherUser = i["user2"];
                  if (i["user2"] == DEBUG_USER_ID) {
                    otherUser = i["user1"];
                    var cd = ChatData(otherUser, DEBUG_USER_ID);
                    cd.ChatId = set[index].id;
                    print("debuggg:  ");
                    print(set[index]);
                    return ListChatItem(
                      Cdata: cd,
                    );
                  } else {
                    var cd = ChatData(DEBUG_USER_ID, otherUser);
                    print("debuggg:  ");
                    print(set[index].id);
                    cd.ChatId = set[index].id;
                    return ListChatItem(Cdata: cd);
                  }
                },
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: Text("Loading")));
        }
      },
    );
  }
}
