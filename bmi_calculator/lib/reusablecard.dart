import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //we want to specify custom value for our card color so we will
  //make a constructor here

  final Color colour;
  final Widget cardchild;
  final Function OnPress;
  ReusableCard({@required this.colour, this.cardchild, this.OnPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child: Container(
          child: cardchild,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
