import 'package:dtpl_app/Pages/AuthPages/landingPage.dart';
import 'package:dtpl_app/Pages/ComplaintPages/complaintHome.dart';
import 'package:dtpl_app/Pages/HomePages/homePage.dart';
import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/buttonProvider.dart';
import 'package:dtpl_app/Providers/complainHomeProvider.dart';
import 'package:dtpl_app/Providers/listViewProvider.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:dtpl_app/Providers/themeProvider.dart';
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
      ),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      ),
      ChangeNotifierProvider<ListViewProvider>(
        create: (context) => ListViewProvider(),
      ),
      ChangeNotifierProvider<ComplainHomeProvider>(
        create: (context) => ComplainHomeProvider(),
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
      // theme: ,
      theme: context.watch<ThemeNotifier>().currentTheme,
      // home: Scaffold(
      // home: ComplainHomePage(),
      //   // body: LandingPage(),
      //   body: HomePage(),
      //   // body: MenuPage(),
      //   // body: ListOfItems(),
      //   // body: SpecifiedMenuBar(),
      // ),
      home: StreamBuilder<User?>(
        // Listen to the authentication state
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Get the user
            User? user = snapshot.data;
            // If the user is not null, they're logged in, navigate to HomePage
            if (user != null) {
              return HomePage();
            }
            // User is not logged in, show the sign-in page
            return LandingPage();
          }
          // Checking the auth state, show a loading indicator
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
