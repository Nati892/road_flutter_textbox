import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_learn/firebase_queries.dart';
import 'package:firebase_learn/Message/message_model.dart';
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
      body: Container(
        color: Colors.grey[100],
        child: LimitedBox(maxHeight: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Center(child: Text("go to chats")),
                onPressed: () {
                  Navigator.pushNamed(context, '/showallchats');
                },
              ),
              TextButton(
                child: Center(child: Text("go to test")),
                onPressed: () {
                  Navigator.pushNamed(context, '/testfbstream');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}















  // body: Column(
      //   children: [
      //     Expanded(
      //         child: TextButton(
      //       child: Text("test add user"),
      //       onPressed: () async {
      //         // var user = UserData();
      //         // user.name = "added by query";
      //         // user.age = 100;
      //         // user.email = "nobody@gmail.com";
      //         // user.phoneNumber = "0500500500";
      //         // user.userType = UserType.talent;
      //         // await fbq.create_user(firestore, user);

      //         var msg = new MessageData(
      //             "user1", "user2", DateTime.now(), false, "text text text");
      //         fbq.sendMessage(firestore,"tcWp4IwncJAFw14wFnAo",msg);
      //         //fbq.del_chat(firestore, "4uM20WwPqCJtCwjgkNeQ");
      //         print("sent");
      //       },
      //     )),
      //     Expanded(
      //       child: Center(
      //           child: FutureBuilder<QuerySnapshot>(
      //         future: fbq.get_all_user_chats_collection(firestore, " "),
      //         builder: (BuildContext context,
      //             AsyncSnapshot<QuerySnapshot> snapshot) {
      //           if (snapshot.hasError) {
      //             return Text("Something went wrong");
      //           }

      //           if (snapshot.hasData && snapshot.hasData) {
      //             if (snapshot.data!.docs.length <= 0)
      //               return Text("Document does not exist");
      //             else {
      //               List<String> got_users = [];

      //               snapshot.data!.docs.forEach((element) {
      //                 got_users.add(element["name"]);
      //               });

      //               return ListTextItem(
      //                 texts: got_users,
      //               );
      //             }
      //           }
      //           if (snapshot.connectionState == ConnectionState.done) {}
      //           return Text("loading");
      //         },
      //       )),
      //     ),
      //   ],