import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  TextEditingController emailIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EmailOTP myAuth = EmailOTP();
    TextEditingController email = TextEditingController();
    @override
    void initState() {
      super.initState();
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
      );
      _opacityAnimation =
          Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
    }

    @override
    void dispose() {
      _animationController?.dispose();
      email.dispose();
      super.dispose();
    }

    Future OnClickResetPassword() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email.text.trim());
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, false, context, _animationController!,
            MsgText: "Check Your mail");
      } on FirebaseAuthException catch (e) {
        // print("$e");
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, false, context, _animationController!,
            MsgText: "$e");
      }
    }

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
