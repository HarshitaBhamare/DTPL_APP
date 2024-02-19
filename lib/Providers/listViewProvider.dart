import 'package:flutter/material.dart';

class ListViewProvider with ChangeNotifier {
  int currentIndex = 0;
  void SetIndex(int index) {
    int bkp = currentIndex;
    currentIndex = index;
    if (bkp != index) {
      notifyListeners();
    }
    // print("Setting Index $index");
  }
}
