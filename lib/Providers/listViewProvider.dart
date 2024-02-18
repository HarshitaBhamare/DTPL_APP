import 'package:flutter/material.dart';

class ListViewProvider with ChangeNotifier {
  int currentIndex = 0;
  void SetIndex(int index) {
    currentIndex = index;
    notifyListeners();
    // print("Setting Index $index");
  }
}
