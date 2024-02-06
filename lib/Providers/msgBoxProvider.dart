import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MsgBoxProvider with ChangeNotifier {
  bool isShowing = false;
  String msgText = "";
  late BuildContext context;
  void ShowHide(bool isShow, BuildContext m_context,
      AnimationController animationController,
      {String MsgText = ""}) {
    isShowing = isShow;
    msgText = MsgText;
    context = m_context;
    notifyListeners();
    if (isShowing) {
      WaitTillEnd(animationController);
    }
  }

  Future<void> WaitTillEnd(AnimationController myAnimationController) async {
    await Future.delayed(Duration(seconds: 2));
    await myAnimationController.reverse().orCancel;
    Provider.of<MsgBoxProvider>(context, listen: false)
        .ShowHide(false, context, myAnimationController);
  }
}
