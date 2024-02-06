import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
import 'package:dtpl_app/Components/customAuthButton.dart';
import 'package:dtpl_app/Pages/AuthPages/loginPage.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:flutter/material.dart';

class buttonManager with ChangeNotifier {
  late BuildContext context;
  void UpdateContext(BuildContext _context) {
    context = _context;
    // notifyListeners();
  }

  // void OnClickLoginPage() {}

  // void OnClickRegsiterPage() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => RegisterPage(),
  //       ));
  // }

  late VoidCallback OnClickLogin;
  late VoidCallback OnClickRegister;
  late VoidCallback OnClickLoginPage;
  late VoidCallback OnClickRegsiterPage;

  late final Map<String, AuthButtons> buttonMap = {
    "login": AuthButtons(
      name: 'Login',
      id: 1,
      onTap: () => OnClickLogin(),
      isAync: true,
    ),
    "register": AuthButtons(
        name: 'Register', id: 2, onTap: () => OnClickRegister(), isAync: true),
    "sendcode": AuthButtons(
        name: 'Send Code',
        id: 3,
        onTap: () => OnClickLoginPage(),
        isAync: true),
    "h_login": AuthButtons(
        name: "Login", id: 4, onTap: () => OnClickLoginPage(), isAync: false),
    "h_register": AuthButtons(
      name: "Regsiter",
      id: 5,
      onTap: () => OnClickRegsiterPage(),
      isAync: false,
    )
  };

  Widget getWidget(String name, VoidCallback myFunc) {
    if (name == 'login') {
      OnClickLogin = myFunc;
    } else if (name == 'register') {
      OnClickRegister = myFunc;
    } else if (name == 'h_login') {
      OnClickLoginPage = myFunc;
    } else if (name == 'h_register') {
      OnClickRegsiterPage = myFunc;
    } else if (name == 'sendcode') {}
    return buttonMap[name]!;
  }
}
