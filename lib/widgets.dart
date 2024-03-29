import 'package:flutter/material.dart';

//List text item
class ListTextItem extends StatelessWidget {
  const ListTextItem({Key? key, required this.texts}) : super(key: key);
  final List<String> texts;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: texts
              .map((e) => Center(
                  child: Align(
                      alignment: Alignment.center,
                      child: Card(child: Text(e)))))
              .toList()),
    );
  }
}
