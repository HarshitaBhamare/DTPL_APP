import 'package:dtpl_app/Components/customAuthButton.dart';
import 'package:dtpl_app/Components/customtextField.dart';
import 'package:dtpl_app/Pages/loadingPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: size.height / 90,
            ),
            Image.asset('assets/images/plant.jpg'),
            SizedBox(height: size.height / 30),
            Text(
              "Welcome to",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height / 38),
            ),
            Text(
              'DTPL',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height / 35),
            ),
            SizedBox(
              height: size.height / 25,
            ),
            Provider.of<buttonManager>(context, listen: false)
                .getWidget('h_login'),
            SizedBox(
              height: size.height / 60,
            ),
            Provider.of<buttonManager>(context, listen: false)
                .getWidget('h_register'),
          ],
        ),
      ),
      // LoadingPage()
    ]);
  }
}
