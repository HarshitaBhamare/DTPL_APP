import 'package:auto_size_text/auto_size_text.dart';
import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/AuthPages/loginPage.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 2));
      print("Hiding");
      Provider.of<LoadingProvider>(context, listen: false).hideLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<LoadingProvider>().isLoading;

    void OnClickLoginPage() {
      print("Chaning the Page");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    }

    void OnClickRegisterPage() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ));
    }

    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height / 15,
              ),

              // SizedBox(height: size.height / 90),
              // SizedBox(height: size.height / 90),
              ClipOval(
                child: Container(
                  // color: Colors.amber,
                  // color: Colors.amber,
                  color: ThemeNotifier.isDark
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.background,
                  width: size.width / 1.1,
                  height: size.height / 3.5,
                  child: Image.asset(
                    'assets/images/logodtpl.png',
                    fit: BoxFit.fitHeight,
                  )
                      .animate()
                      .fadeIn(delay: Duration(milliseconds: 100))
                      .scale(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width / 30,
                        ),
                        Container(
                          width: size.width / 1.2,
                          height: size.height / 20,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: AutoSizeText(" Welcome to,",
                                  textAlign: TextAlign.left,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontFamily: 'SFCompactRounded',
                                    // fontWeight: FontWeight.bold,
                                    // fontWeight: FontWeight.w200,
                                    fontSize: size.height / 33,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ))
                              .animate()
                              .fade(delay: Duration(milliseconds: 100))
                              .scale(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width / 20,
                        ),
                        Container(
                          width: size.width / 1.2,
                          height: size.height / 10,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child:
                              AutoSizeText("Devi Technocraft Private Limited",
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontFamily: 'SFCompactRounded',
                                        // fontWeight: FontWeight.bold,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.height / 30,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ))
                                  .animate()
                                  .fade(delay: Duration(milliseconds: 100))
                                  .scale(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height / 20),
              Center(
                child: Text(
                  "Premium Soft Serve Solutions with Style and Efficiency",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    fontWeight: FontWeight.w100,
                    fontSize: size.height / 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
                    .animate()
                    .fade(delay: Duration(milliseconds: 100))
                    .scale()
                    .animate()
                    .fade(delay: Duration(milliseconds: 500))
                    .slideY(),
              ),
              SizedBox(height: size.height / 20),

              Provider.of<buttonManager>(context, listen: false)
                  .getWidget('h_login', OnClickLoginPage)
                  .animate()
                  .fade(delay: Duration(milliseconds: 700))
                  .slideY(),
              SizedBox(
                height: size.height / 20,
              ),
              Provider.of<buttonManager>(context, listen: false)
                  .getWidget('h_register', OnClickRegisterPage)
                  .animate()
                  .fade(delay: Duration(milliseconds: 900))
                  .slideY(),
            ],
          ),
        ),
      ),
      isLoading ? LoadingPage() : SizedBox()
    ]);
  }
}
