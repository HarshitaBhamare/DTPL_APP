import 'package:flutter/material.dart';

class buttonProvider with ChangeNotifier {
  bool isClicked = false;

  int currentID = -1;
  void OnClicked(int id) {
    isClicked = !isClicked;
    currentID = id;
    notifyListeners();
  }
}
