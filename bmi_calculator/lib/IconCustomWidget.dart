import 'package:flutter/material.dart';

//created a custom icon widget for our first two cards
class IconCustomWidget extends StatelessWidget {
  IconCustomWidget({this.t, this.i});
  final String t;
  final IconData i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(i, size: 80.0),
        SizedBox(height: 5.0),
        Text(t, style: TextStyle(fontSize: 18.0, color: Colors.lime[200]))
      ],
    );
  }
}
