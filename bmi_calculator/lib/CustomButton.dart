import 'package:flutter/material.dart';

//Custom button that we defined for our weight and age card section

class CustomButton extends StatelessWidget {
  final IconData I;
  final Function OnPressed;
  CustomButton({@required this.I, @required this.OnPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: OnPressed,
        child: Icon(I),
        shape: CircleBorder(),
        fillColor: Color(0xFF1D1E43),
        disabledElevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ));
  }
}
