import 'package:flutter/material.dart';

class ComplainHomeProvider with ChangeNotifier {
  bool onComplainRegsiterPage = false;

  void OnChangePage() {
    onComplainRegsiterPage = !onComplainRegsiterPage;
    notifyListeners();
  }
}
