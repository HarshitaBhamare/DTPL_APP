import 'package:dtpl_app/Components/customAuthButton.dart';
import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Pages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width / 1.1,
              child: Container(
                  child: Text(
                'Forget Password?',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height / 30),
              )),
            ),
            SizedBox(
              height: size.height / 90,
            ),
            SizedBox(
              width: size.width / 1.1,
              child: Container(
                  alignment: Alignment.topLeft,
                  width: size.width,
                  // alignment: Alignment.center,
                  child: Text(
                    "Don't worry it happens. Please enter the email address linked with your account",
                    style: TextStyle(
                        fontSize: size.height / 60, color: Colors.grey),
                  )),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            MyTextField(hint: 'Email', show: true),
            SizedBox(
              height: size.height / 30,
            ),
            Provider.of<buttonManager>(context, listen: false)
                .getWidget('sendcode'),
            SizedBox(height: size.height / 2.1),
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
