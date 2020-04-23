import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomcontainerheight = 80.0;
const usedcardcolor = Color(0xFF1D1E33);
const bottomcolor = Color(0xFF11CDC4);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: usedcardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Icon(FontAwesomeIcons.mars, size: 80.0),
                        // SizedBox(height: 5.0),
                        Text('Male',
                            style: TextStyle(
                              fontSize: 18.0,
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: usedcardcolor,
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: usedcardcolor,
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: usedcardcolor,
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: usedcardcolor,
                  )),
                ],
              ),
            ),
            Container(
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 30),
              ),
              color: bottomcolor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height:
                  bottomcontainerheight, // we have declared it as a constant as in compile time we will
              //be easily able to change it .
            )
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  //we want to specify custom value for our card color so we will
  //make a constructor here

  final Color colour;
  final Widget cardchild;
  ReusableCard({@required this.colour, this.cardchild});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)));
  }
}
