import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learn/Chat/chat_model.dart';
import 'package:firebase_learn/Message/message_model.dart';
import 'package:firebase_learn/Screens/User%20chat%20screen/user_chat_screen.dart';
import 'package:firebase_learn/User/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Screens/Chat screen/chatsScreen.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //firebase init
  await Hive.initFlutter(); //Hive init
  Hive.registerAdapter(MessageDataAdapter());
  Hive.registerAdapter(ChatDataAdapter());
  Hive.registerAdapter(UserDataAdapter());
  await Hive.openBox<MessageData>('MessageData');
  await Hive.openBox<ChatData>('ChatData');
  await Hive.openBox<UserData>('UserData');
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
        '/': (context) => const App(), //main app screen
        // When navigating to the "/second" route, build the SecondScreen widget.
        "/showallchats": (context) => const ChatsScreen(), //shows all chats
        "/userchat": (context) => const ChatScreen(), //single user chat
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
