import 'package:bmicalculator/BmiBrain.dart';
import 'package:bmicalculator/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconCustomWidget.dart';
import 'reusablecard.dart';
import 'CustomButton.dart';
import 'BmiBrain.dart';

const bottomcontainerheight = 80.0;
const usedcardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);
const bottomcolor = Color(0xFF1D1E43);
int height = 180;
int weight = 60;
int age = 10;

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
                        IconCustomWidget(t: 'MALE', i: FontAwesomeIcons.mars),
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
                        t: 'FEMALE', i: FontAwesomeIcons.venus),
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
                    'HEIGHT',
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
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT (Kg)',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.lime[200]),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 30.0, color: Colors.lime[200]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButton(
                                I: FontAwesomeIcons.minus,
                                OnPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomButton(
                                I: FontAwesomeIcons.plus,
                                OnPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ], // USE CTRL +ALT+B FOR SEEING IMPLEMENTATION OF FLOATIN ACTION BUTTON
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: usedcardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE ',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.lime[200]),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 30.0, color: Colors.lime[200]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButton(
                                I: FontAwesomeIcons.minus,
                                OnPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            CustomButton(
                                I: FontAwesomeIcons.plus,
                                OnPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ], // USE CTRL +ALT+B FOR SEEING IMPLEMENTATION OF FLOATIN ACTION BUTTON
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Bmibrain cal = Bmibrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                          Bmiresult: cal.Calculatebmi(),
                          Resulttext: cal.getResult(),
                          Suggestion: cal.getSuggestion()),
                    ));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 30.0, color: Colors.lime[200]),
                  ),
                ),
                color: bottomcolor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height:
                    bottomcontainerheight, // we have declared it as a constant as in compile time we will
                //be easily able to change it .
              ),
            )
          ],
        ));
  }
}
