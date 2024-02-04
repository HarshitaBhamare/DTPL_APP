import 'package:dtpl_app/Components/customAuthButton.dart';
import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Components/tile.dart';
import 'package:dtpl_app/Pages/loginPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width / 1.2,
              child: Text(
                'Hello! Register to get\nstarted',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height / 30),
              ),
            ),
            SizedBox(height: size.height / 120),
            MyTextField(hint: 'First Name', show: true),
            SizedBox(height: size.height / 60),
            MyTextField(hint: 'Last Name', show: true),
            SizedBox(height: size.height / 60),
            MyTextField(hint: 'E-mail', show: true),
            SizedBox(height: size.height / 60),
            MyTextField(hint: 'Password', show: true),
            SizedBox(height: size.height / 60),
            MyTextField(hint: 'Confirm Password', show: true),
            SizedBox(height: size.height / 25),
            Provider.of<buttonManager>(context, listen: false)
                .getWidget('register'),
            // SizedBox(height: size.height / 10),
            SizedBox(height: size.height / 50),
            Row(
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
            SizedBox(height: size.height / 60),
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
            SizedBox(
              height: size.height / 90,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: size.height / 60,
                    ),
                  ),
                  SizedBox(width: size.width / 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Login",
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
