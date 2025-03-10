import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  List favList = [];

  addToList(index) {
    favList.add(index);
    notifyListeners();
  }

  removeFromList(index) {
    favList.remove(index);
    notifyListeners();
  }
}
