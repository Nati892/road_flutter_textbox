import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learn/Screens/User%20chat%20screen/user_chat_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Chat screen/chatsScreen.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'road sandBox',
      initialRoute: '/',
      routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => const App(),//main app screen
    // When navigating to the "/second" route, build the SecondScreen widget.
    "/showallchats": (context) => const ChatsScreen(),//shows all chats
    "/userchat": (context) => const ChatScreen(),//single user chat

  },
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      
    );
  }
}
