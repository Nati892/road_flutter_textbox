import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:flutter/material.dart';

class TestFbStream extends StatefulWidget {
  const TestFbStream({Key? key}) : super(key: key);

  @override
  State<TestFbStream> createState() => _TestFbStreamState();
}

class _TestFbStreamState extends State<TestFbStream> {
  final String route = "/testfbstream";

  final String DEBUG_USER_ID = "459rizMNZboZgo95EcIy";
  List<QueryDocumentSnapshot> set = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase_queries().get_all_user_chats_collection(
          FirebaseFirestore.instance, DEBUG_USER_ID),
      initialData: set,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print("data:::::::::");
          print(snapshot.data);
          set.addAll(snapshot.data);
          print("size: " + set.length.toString());
          return Scaffold(
            appBar: AppBar(title: Text("Chats")),
            body: Center(
              child: ListView.builder(
                itemCount: set.length,
                itemBuilder: (context, index) {
                  var i = set[index];
                  print("set size: " + set.length.toString());
                  var otherUser = i["user2"];
                  if (i["user2"] == DEBUG_USER_ID) otherUser = i["user1"];

                  return ListTile(
                    title: Text(snapshot.data[index].id.toString()),
                    subtitle: Text(otherUser),
                  );
                },
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: Text("hi")));
        }
      },
    );
  }
}
