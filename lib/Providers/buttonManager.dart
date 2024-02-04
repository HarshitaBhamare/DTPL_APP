import 'package:dtpl_app/Components/customAuthButton.dart';
import 'package:dtpl_app/Pages/loginPage.dart';
import 'package:dtpl_app/Pages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonProvider.dart';
import 'package:flutter/material.dart';

class buttonManager with ChangeNotifier {
  late BuildContext context;
  void UpdateContext(BuildContext _context) {
    context = _context;
    // notifyListeners();
  }

  void OnClickLoginPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }

  void OnClickLogin() {}

  void OnClickRegister() {}

  void OnClickRegsiterPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ));
  }

  late final Map<String, AuthButtons> buttonMap = {
    "login": AuthButtons(
      name: 'Login',
      id: 1,
      onTap: () => OnClickLogin(),
    ),
    "register":
        AuthButtons(name: 'Register', id: 2, onTap: () => OnClickRegister()),
    "sendcode":
        AuthButtons(name: 'Send Code', id: 3, onTap: () => OnClickLoginPage()),
    "h_login":
        AuthButtons(name: "Login", id: 4, onTap: () => OnClickLoginPage()),
    "h_register":
        AuthButtons(name: "Regsiter", id: 5, onTap: () => OnClickRegsiterPage())
  };

  Widget getWidget(String name) {
    return buttonMap[name]!;
  }
}
