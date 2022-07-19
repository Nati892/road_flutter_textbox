import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomChatBar extends StatefulWidget {
  const BottomChatBar({Key? key}) : super(key: key);

  @override
  State<BottomChatBar> createState() => _BottomChatBarState();
}

class _BottomChatBarState extends State<BottomChatBar> {
  var TFController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            TextField(controller: TFController),
            TextButton(
                onPressed: () {
                  print("printer: ${TFController.text}");
                },
                child: Text("send"))
          ],
        ),
      ),
    );
  }
}
