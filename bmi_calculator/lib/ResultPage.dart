import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'package:flutter/rendering.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.Bmiresult,
      @required this.Resulttext,
      @required this.Suggestion});

  final String Bmiresult;
  final String Resulttext;
  final String Suggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(fontSize: 30.0, color: Colors.lime[200]),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.lime[200],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: usedcardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Resulttext.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF24D876),
                    ),
                  ),
                  Text(
                    Bmiresult,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.lime[200],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Suggestion.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF24D876),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
          ),
        ],
      ),
    );
  }
}
