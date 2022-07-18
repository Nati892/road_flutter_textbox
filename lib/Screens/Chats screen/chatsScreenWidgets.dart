import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/Chat/chat_model.dart';
import 'package:firebase_learn/Screens/User%20chat%20screen/user_chat_screen_args.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:flutter/material.dart';

class ListChatItem extends StatelessWidget {
  const ListChatItem({Key? key, required this.Cdata}) : super(key: key);
  final ChatData Cdata;
  final String DEBUG_USER_ID = "459rizMNZboZgo95EcIy";

  @override
  Widget build(BuildContext context) {
    String otherUserId = Cdata.user1_Id;
    if (Cdata.user1_Id == DEBUG_USER_ID) otherUserId = Cdata.user2_id;
    return FutureBuilder(
      future: Firebase_queries()
          .getUserById(FirebaseFirestore.instance, otherUserId),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
              child: GestureDetector(
                onTap: () {
                  //when preesed only debugs
                  print("Pressed!! ${snapshot.data["name"]}");
                  Navigator.pushNamed(context, '/userchat',
                      arguments: UserChatScreenArgs(Cdata.ChatId));
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.cyan,
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Center(
                      child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(Icons.person),
                      ),
                      Text("${snapshot.data["name"]}"),
                    ],
                  )),
                ),
              ));
        } else {
          return Text("loading");
        }
      },
    );
  }
}
