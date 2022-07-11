import 'package:firebase_core/firebase_core.dart';
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
    '/': (context) => const App(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    "/showchats": (context) => const ChatsScreen(),
  },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      
    );
  }
}
