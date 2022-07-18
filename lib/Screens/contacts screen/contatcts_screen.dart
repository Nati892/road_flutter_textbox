import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

//TODO get all contacs from phone contacts/google/whatever and see who hass an account, present them in contacts screen too
class _ContactsScreenState extends State<ContactsScreen> {
final String route="/contacts";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Center(
        child: ListView(
          //contacs go here
          children: [],
        ),
      ),
    );
  }
}
