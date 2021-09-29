import 'package:flutter/material.dart';

class BuildList extends StatefulWidget {
  final String label;
  final int id;
  final Color fontColor;

  const BuildList({
    Key? key,
    required this.label,
    required this.id,
    required this.fontColor,
  }) : super(key: key);

  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Container(
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              )),
        ),
      ),
    );
  }
}
