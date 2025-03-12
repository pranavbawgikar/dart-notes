import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int countValue;

  CounterProvider({ this.countValue = 0 });

  void incrementNumber() {
    countValue++;
    notifyListeners();
  }

  void decrementNumber() {
    countValue--;
    notifyListeners();
  }
}
