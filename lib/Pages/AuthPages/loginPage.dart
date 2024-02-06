import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
import 'package:dtpl_app/Components/customMsgBox.dart';
import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Components/tile.dart';
import 'package:dtpl_app/Pages/AuthPages/forgetPassword.dart';
import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  bool isCheck = false;
  TextEditingController emailIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    super.dispose();
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isLoading = context.watch<LoadingProvider>().isLoading;
    final isShowing = context.watch<MsgBoxProvider>().isShowing;
    if (isShowing) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
    // Listen to changes and animate accordingly
    void OnClickLogin() {
      if (emailIDController.text.isEmpty) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Please Enter Email ID");
        return;
      } else if (passwordController.text.isEmpty) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Please Enter Password to Login");
        return;
      }
      if (!isEmailValid(emailIDController.text)) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Please Enter Valid Email ID :)");
        return;
      }
      Provider.of<LoadingProvider>(context, listen: false).showLoading();
      FirebaseAuthService().signInWithEmailAndPassword(emailIDController.text,
          passwordController.text, context, _animationController!);
    }

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
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
                    fontWeight: FontWeight.bold,
                    fontSize: size.height / 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
              ),
              SizedBox(height: size.height / 30),
              MyTextField(
                hint: 'E-mail',
                isPasswordField: false,
                show: false,
                textEditingController: emailIDController,
              ),
              SizedBox(height: size.height / 60),
              MyTextField(
                hint: 'Password',
                isPasswordField: true,
                show: false,
                textEditingController: passwordController,
              ),
              SizedBox(height: size.height / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        child: isCheck
                            ? Icon(
                                Icons.check_box,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      ),
                      SizedBox(
                        width: size.width / 100,
                      ),
                      Text(
                        "Remeber Me!",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: size.height / 55,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width / 6.4,
                  ),
                  SizedBox(
                    width: size.width / 2.3,
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
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height / 55),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height / 60),
              SizedBox(height: size.height / 70),
              Provider.of<buttonManager>(context, listen: false)
                  .getWidget('login', OnClickLogin),
              SizedBox(height: size.height / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      thickness: 1,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  Text(
                    "Or Log with",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 1,
                      color: Theme.of(context).colorScheme.tertiary,
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
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) => isShowing
            ? Opacity(
                opacity: _opacityAnimation!.value,
                child: MsgBox(
                  animationController: _animationController,
                ), // Your MsgBox or the wrapped version
              )
            : SizedBox(),
      ),
      isLoading
          ? LoadingPage()
          : SizedBox(
              width: 0,
              height: 0,
            )
    ]);
  }
}