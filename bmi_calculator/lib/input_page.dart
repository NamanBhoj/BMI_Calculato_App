import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconCustomWidget.dart';
import 'reusablecard.dart';

const bottomcontainerheight = 80.0;
const usedcardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);
const bottomcolor = Color(0xFF11CDC4);
int height = 180;

enum GenderType { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType SelectedGender;
//  Color malecardcolor = usedcardcolor;
//  Color femalecardcolor = usedcardcolor;
//
//  void update(GenderType g ) {
//    if (g == GenderType.Male) {
//      if (malecardcolor == usedcardcolor) {
//        malecardcolor = inactivecardcolor;
//      } else {
//        malecardcolor = usedcardcolor;
//        femalecardcolor = inactivecardcolor;
//      }
//    }
//    if (g == GenderType.Female) {
//      //female
//      if (femalecardcolor == usedcardcolor) {
//        femalecardcolor = inactivecardcolor;
//      } else {
//        femalecardcolor = usedcardcolor;
//        malecardcolor = inactivecardcolor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    OnPress: () {
                      setState(() {
                        SelectedGender = GenderType.Male;
                      });
                    },
                    //we have used ternary operator instead of using if else, "reduces down the code"
                    //from line 22 to 43
                    colour: SelectedGender == GenderType.Male
                        ? usedcardcolor
                        : inactivecardcolor,
                    cardchild:
                        IconCustomWidget(t: 'Male', i: FontAwesomeIcons.mars),
                  )),
                  Expanded(
                      child: ReusableCard(
                    OnPress: () {
                      setState(() {
                        SelectedGender = GenderType.Female;
                        //we have passed a function to reusable card
                        //in reusablecard.dart file
                        //in dart you can pass functions as arguments
                      });
                    },
                    colour: SelectedGender == GenderType.Female
                        ? usedcardcolor
                        : inactivecardcolor,
                    cardchild: IconCustomWidget(
                        t: 'Female', i: FontAwesomeIcons.venus),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: usedcardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: TextStyle(fontSize: 18.0, color: Colors.lime[200]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style:
                            TextStyle(fontSize: 30.0, color: Colors.lime[200]),
                      ),
                      Text(
                        'cm',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.lime[200]),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.redAccent,
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ],
              ),
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
