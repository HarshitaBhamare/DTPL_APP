import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MsgBoxProvider with ChangeNotifier {
  Color errorColor = Colors.red;
  Color successColor = Colors.green;
  bool isSuccessMsg = false;
  bool isShowing = false;
  String msgText = "";
  late BuildContext context;
  void ShowHide(bool isShow, bool isSuccess, BuildContext m_context,
      AnimationController animationController,
      {String MsgText = ""}) {
    if (isShowing) {
      isShowing = false;
      notifyListeners();
      print("Currently showing");
      return;
    }
    isShowing = isShow;
    msgText = MsgText;
    context = m_context;
    isSuccessMsg = isSuccess;
    // print("Showing the Message Screen");
    notifyListeners();

    if (isShowing) {
      WaitTillEnd(animationController, isSuccess);
    }
  }

  Future<void> WaitTillEnd(
      AnimationController myAnimationController, bool isSuccess) async {
    await Future.delayed(Duration(seconds: 2));
    // if(myAnimationController.)
    if (myAnimationController != null && myAnimationController.isAnimating) {
      try {
        await myAnimationController.reverse().orCancel;
      } on TickerCanceled {}
    }
    try {
      await myAnimationController.reverse().orCancel;

      Provider.of<MsgBoxProvider>(context, listen: false)
          .ShowHide(false, isSuccess, context, myAnimationController);
    } catch (e) {}
  }
}
