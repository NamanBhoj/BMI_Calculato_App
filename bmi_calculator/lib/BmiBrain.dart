import 'dart:math';

class Bmibrain {
  final int height;
  final int weight;

  double _bmi;

  Bmibrain({this.height, this.weight});

  String Calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi
        .toStringAsFixed(2); // specify the number of decimal places you want
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSuggestion() {
    if (_bmi >= 25.0) {
      return 'You need to exercises and lose a few pounds';
    } else if (_bmi >= 18.5) {
      return 'You seem perfectly healthy ';
    } else {
      return 'Damn, dude you need to snack up a lil more';
    }
  }
}
