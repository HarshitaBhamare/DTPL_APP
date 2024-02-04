import 'package:dtpl_app/Components/customAuthButton.dart';
import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Components/tile.dart';
import 'package:dtpl_app/Pages/forgetPassword.dart';
import 'package:dtpl_app/Pages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          // centerTitle: true,
          ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 1.2,
              child: Container(
                  // alignment: Alignment.topLeft,
                  child: Text(
                'Welcome back! Glad\nto see you, Again!',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height / 30),
              )),
            ),
            SizedBox(height: size.height / 30),
            MyTextField(hint: 'E-mail', show: true),
            SizedBox(height: size.height / 60),
            MyTextField(hint: 'Password', show: true),
            SizedBox(height: size.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: size.width / 3,
                  child: InkWell(
                    onTap: () {
                      print('Forget Password of login page is pressed');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: Colors.blueGrey.shade500,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 40),
            Provider.of<buttonManager>(context, listen: false)
                .getWidget('login'),
            SizedBox(height: size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 1,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  "Or Log with",
                  style: TextStyle(
                      color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 40),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/images/google.png'),
                  SizedBox(
                    width: size.width / 7,
                  ),
                  SquareTile(imagePath: 'assets/images/apple.png'),
                ],
              ),
            ),
            SizedBox(height: size.height / 6),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't you have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height / 60,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: size.width / 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: size.height / 60,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey.shade400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
