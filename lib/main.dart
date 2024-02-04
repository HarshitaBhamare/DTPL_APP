import 'package:dtpl_app/Pages/forgetPassword.dart';
import 'package:dtpl_app/Pages/landindPage.dart';
import 'package:dtpl_app/Pages/loadingPage.dart';
import 'package:dtpl_app/Pages/loginPage.dart';
import 'package:dtpl_app/Pages/registerPage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/buttonProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    buttonManager().context = context;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<buttonProvider>(
          create: (context) => buttonProvider(),
        ),
        ChangeNotifierProvider<buttonManager>(
          create: (context) => buttonManager(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LandingPage(),
          // body: LoadingPage(),
        ),
      ),
    );
  }
}
