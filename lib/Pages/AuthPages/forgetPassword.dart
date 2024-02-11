import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void OnClickResetPassword() {}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width / 1.1,
              child: Container(
                  child: Text('Forget Password?',
                      style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontWeight: FontWeight.w900,
                        fontSize: size.height / 30,
                        color: Theme.of(context).colorScheme.primary,
                      ))),
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
                        fontFamily: 'SFCompactRounded',
                        fontSize: size.height / 60,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            MyTextField(
                hint: 'Email',
                isPasswordField: false,
                show: true,
                textEditingController: emailIDController),
            SizedBox(
              height: size.height / 30,
            ),
            Provider.of<buttonManager>(context, listen: false)
                .getWidget('sendcode', OnClickResetPassword),
            SizedBox(height: size.height / 2.1),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't you have an account?",
                      style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontWeight: FontWeight.w900,
                        fontSize: size.height / 60,
                        color: Colors.grey,
                      )),
                  SizedBox(width: size.width / 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Register Now",
                        style: TextStyle(
                          fontSize: size.height / 60,
                          fontFamily: 'SFCompactRounded',
                          // letterSpacing: .7,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.tertiary,
                        )),
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
