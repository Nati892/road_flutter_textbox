import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:firebase_learn/widgets.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var fbq = Firebase_queries();
    return Scaffold(
      body: Center(
          child: FutureBuilder<QuerySnapshot>(
        future: fbq.getCollection(firestore, "users"),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && snapshot.hasData) {
            if (snapshot.data!.docs.length <= 0)
              return Text("Document does not exist");
            else {
              List<String> got_users = [];

              snapshot.data!.docs.forEach((element) {
                got_users.add(element["name"]);
              });

              return ListTextItem(
                texts: got_users,
              );
            }
          }

          if (snapshot.connectionState == ConnectionState.done) {}

          return Text("loading");
        },
      )),
    );
  }
}
