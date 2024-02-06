import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
import 'package:dtpl_app/Components/customMsgBox.dart';
import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Components/tile.dart';
import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/AuthPages/loginPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailIDController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
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
    void OnClickRegsiter() {
      if (firstNameController.text.isEmpty) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Please Enter First Name");
        return;
      } else if (lastNameController.text.isEmpty) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Please Enter Last Name");
        return;
      }
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
      if (passwordController.text.isEmpty) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Please Enter Confirm Password to Login");
        return;
      } else if (passwordController.text != confirmpasswordController.text) {
        Provider.of<LoadingProvider>(context, listen: false).hideLoading();
        Provider.of<MsgBoxProvider>(context, listen: false).ShowHide(
            true, context, _animationController!,
            MsgText: "Password is not matched");
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
      FirebaseAuthService().registerWithEmailAndPassword(emailIDController.text,
          passwordController.text, context, _animationController!);
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: size.width / 1.2,
                  child: Text(
                    'Hello! Register to get\nstarted',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height / 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: size.height / 120),
                MyTextField(
                    hint: 'First Name',
                    isPasswordField: false,
                    show: true,
                    textEditingController: firstNameController),
                SizedBox(height: size.height / 60),
                MyTextField(
                  hint: 'Last Name',
                  isPasswordField: false,
                  show: true,
                  textEditingController: lastNameController,
                ),
                SizedBox(height: size.height / 60),
                MyTextField(
                  hint: 'E-mail',
                  isPasswordField: false,
                  show: true,
                  textEditingController: emailIDController,
                ),
                SizedBox(height: size.height / 60),
                MyTextField(
                  hint: 'Password',
                  isPasswordField: true,
                  show: false,
                  textEditingController: passwordController,
                ),
                SizedBox(height: size.height / 60),
                MyTextField(
                  hint: 'Confirm Password',
                  isPasswordField: true,
                  show: false,
                  textEditingController: confirmpasswordController,
                ),
                SizedBox(height: size.height / 25),
                Provider.of<buttonManager>(context, listen: false)
                    .getWidget('register', OnClickRegsiter),
                // SizedBox(height: size.height / 10),
                SizedBox(height: size.height / 50),
                Row(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login",
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
      ],
    );
  }
}