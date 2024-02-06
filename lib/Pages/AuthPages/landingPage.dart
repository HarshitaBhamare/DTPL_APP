import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/AuthPages/loginPage.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
            children: [
              SizedBox(
                height: size.height / 90,
              ),
              Image.asset('assets/images/plant.jpg'),
              SizedBox(height: size.height / 30),
              Text("Welcome to",
                  style: GoogleFonts.gowunBatang(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: size.height / 35,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )),
              Text('DTPL',
                  style: GoogleFonts.gowunBatang(
                    textStyle: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900,
                      fontSize: size.height / 35,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )),
              SizedBox(
                height: size.height / 25,
              ),
              Provider.of<buttonManager>(context, listen: false)
                  .getWidget('h_login', OnClickLoginPage),
              SizedBox(
                height: size.height / 60,
              ),
              Provider.of<buttonManager>(context, listen: false)
                  .getWidget('h_register', OnClickRegisterPage),
            ],
          ),
        ),
      ),
      isLoading ? LoadingPage() : SizedBox()
    ]);
  }
}
