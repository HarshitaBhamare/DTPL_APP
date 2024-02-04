import 'package:flutter/material.dart';

class LoadingProvider with ChangeNotifier {
  bool isLoading = false;
  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
