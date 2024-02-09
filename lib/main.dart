import 'package:dtpl_app/Pages/HomePages/customList.dart';
import 'package:dtpl_app/Components/customMsgBox.dart';
import 'package:dtpl_app/Pages/AuthPages/landingPage.dart';
import 'package:dtpl_app/Pages/AuthPages/loginPage.dart';
import 'package:dtpl_app/Pages/AuthPages/registerPage.dart';
import 'package:dtpl_app/Pages/HomePages/homePage.dart';
import 'package:dtpl_app/Pages/HomePages/SpecifiedMenuBar.dart';
import 'package:dtpl_app/Pages/HomePages/listModel.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/buttonProvider.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:dtpl_app/Themes/colorPalate.dart';
import 'package:dtpl_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<buttonProvider>(
        create: (context) => buttonProvider(),
      ),
      ChangeNotifierProvider<buttonManager>(
        create: (context) => buttonManager(),
      ),
      ChangeNotifierProvider<LoadingProvider>(
        create: (context) => LoadingProvider(),
      ),
      ChangeNotifierProvider<MsgBoxProvider>(
        create: (context) => MsgBoxProvider(),
      )
    ],
    child: MyApp(),
  ));
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.lightTheme,
      home: Scaffold(
        // body: SpecifiedMenuBar(),
        body: ListOfItems(),
        // body: LandingPage(),
        // body: SpecifiedMenuBar(),
      ),
    );
  }
}
