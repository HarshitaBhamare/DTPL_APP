import 'dart:convert';

import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
import 'package:dtpl_app/Models/MachineModel.dart';
import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/HomePages/SpecifiedMenuBar.dart';
import 'package:dtpl_app/Pages/HomePages/customList.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/themeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:flutter/animation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GlobalKey> itemKeys = List.generate(10, (index) => GlobalKey());

  Future<List<MachineModel>> loadMachinesFromAsset() async {
    final jsonString = await rootBundle.loadString('assets/machineList.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse
        .map((machineJson) => MachineModel.fromJson(machineJson))
        .toList();
  }

  Future<void> uploadMachines() async {
    List<MachineModel> machines = await loadMachinesFromAsset();
    print(machines.length);
    for (var machine in machines) {
      print(machine.machineName!);
      await uploadMachine(machine);
    }
  }

  double x = 0;
  double y = 0;
  double width = 0;
  double height = 0;
  void _getWidgetPosition(int id, VoidCallback onPositionRetrieved) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          itemKeys[id].currentContext?.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      final Size size = renderBox.size; // Capture the size of the widget

      print("Widget Position: x: ${position.dx}, y: ${position.dy}");
      x = position.dx;
      y = position.dy;
      width = size.width; // Update width
      height = size.height; // Update height

      onPositionRetrieved(); // Call the callback after x, y, width, and height have been updated
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isLoading = context.watch<LoadingProvider>().isLoading;
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          actions: [],
          // iconTheme: IconThemeData(
          //     color: Theme.of(context).colorScheme.primaryContainer),
          title: Text('DTPL',
              style: TextStyle(
                fontFamily: 'SFCompactRounded',
                letterSpacing: 5,
                color: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.w900,
              )).animate().fade(delay: Duration(milliseconds: 100)).scale(),
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      // width: ,
                      child: Container(
                        width: size.width / 5.2,
                        height: size.height / 11,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FutureBuilder(
                          future: FirebaseAuthService().getProfilePic(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                color: Colors.red,
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'Error loading profile picture',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              );
                            } else if (snapshot.hasData) {
                              return snapshot.data!;
                            } else {
                              return Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      child: Icon(
                                    Icons.person,
                                  )));
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Text(
                      'Harshita Bhamare',
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          fontSize: size.height / 30,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 60,
              ),
              ListTile(
                onTap: () async {
                  final themeNotifier =
                      Provider.of<ThemeNotifier>(context, listen: false);
                  themeNotifier.updateTheme();
                },
                leading: SizedBox(
                    width: size.width / 9,
                    child: !ThemeNotifier.isDark
                        ? Image.asset(
                            'assets/images/light.png',
                            height: size.height / 20,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          )
                        : Image.asset(
                            'assets/images/dark.png',
                            height: size.height / 32,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          )),
                title: Text(
                  'Theme',
                  style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: size.height / 38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 60,
              ),
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => SpecifiedMenuBar(),
                  //     ));
                },
                leading: SizedBox(
                    width: size.width / 9,
                    child: Image.asset(
                      'assets/images/users.png',
                      height: size.height / 20,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    )),
                title: Text(
                  'About Us',
                  style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: size.height / 38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 60,
              ),
              ListTile(
                leading: SizedBox(
                    width: size.width / 9,
                    child: Image.asset(
                      'assets/images/avatar.png',
                      height: size.height / 25,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    )),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: size.height / 38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 60,
              ),
              ListTile(
                leading: SizedBox(
                  width: size.width / 9,
                  child: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    size: size.height / 28,
                  ),
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: size.height / 38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 3,
              ),
              ListTile(
                  onTap: () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      String signInMethod = user.providerData.isEmpty
                          ? 'Unknown'
                          : user.providerData[0].providerId;

                      // If the user signed in with Google, sign out from Google first
                      if (signInMethod == 'google.com') {
                        // final GoogleSignIn googleSignIn = GoogleSignIn();
                        print("Signout Using : Google");
                        await FirebaseAuthService().signOutGoogle(context);
                      } else {
                        print("Signout Using : EmailID");
                        await FirebaseAuthService().signOut(context);
                      }
                      // Sign out from Firebase

                      // Additional sign-out logic for your app (e.g., navigate to the sign-in page)
                      // You might want to call your custom signOut method from FirebaseAuthService here if it does additional cleanup
                      // FirebaseAuthService().signOut(context);
                    }
                  },
                  leading: SizedBox(
                      width: size.width / 9,
                      child: Image.asset(
                        'assets/images/logout.png',
                        height: size.height / 31,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: size.height / 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: size.width / 1.04,
                  child: Text(
                    'Featured Machines :',
                    style: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                      .animate()
                      .fade(delay: Duration(milliseconds: 500))
                      .slideY()),
              InkWell(
                onTap: () async {
                  // await uploadMachines();

                  // print('Menu open');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SpecifiedMenuBar()));
                },
                child: SizedBox(
                  height: size.height / 2.2,
                  width: size.width / 1.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => Card(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: SizedBox(
                        //width for real container
                        width: size.width / 1.15,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height / 90,
                            ),
                            Container(
                              height: size.height / 4.5,
                              width: size.width / 1.23,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'IMAGE',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              )),
                              // child: Image.asset('assets/images/dtpllogo.png'),
                            ),
                            SizedBox(
                              height: size.height / 100,
                            ),
                            Container(
                              height: size.height / 20,
                              width: size.width / 1.23,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                    fontFamily: 'SFCompactRounded',
                                    fontSize: size.height / 60,
                                    // letterSpacing: .7,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 100,
                            ),
                            Container(
                              height: size.height / 20,
                              width: size.width / 1.23,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                    fontFamily: 'SFCompactRounded',
                                    fontSize: size.height / 60,
                                    // letterSpacing: .7,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 100,
                            ),
                            Container(
                              height: size.height / 14,
                              width: size.width / 1.23,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  'Specifications',
                                  style: TextStyle(
                                    fontFamily: 'SFCompactRounded',
                                    fontSize: size.height / 60,
                                    letterSpacing: .7,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animate().fade(delay: Duration(milliseconds: 800)).slideX(),
              ),
              SizedBox(
                width: size.width / 1.05,
                child: Text('Machines :',
                        style: TextStyle(
                            fontFamily: 'SFCompactRounded',
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fontSize: size.height / 45,
                            fontWeight: FontWeight.w800))
                    .animate()
                    .fade(delay: const Duration(milliseconds: 800))
                    .slideY(),
              ),
              // SizedBox(height: size.height / 50),
              SizedBox(
                width: size.width / 1.05,
                height: size.height / 3.9,
                // color: Colors.amber,
                child: Container(
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print("I tapped");
                              _getWidgetPosition(index, () {
                                // This code will now execute after x, y, width, and height have been updated
                                print(
                                    "x: $x, y: $y, width: $width, height: $height");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SpecifiedMenuBar(
                                              xPosi: x,
                                              yPosi: y,
                                              width: width, // Pass width
                                              height: height, // Pass height
                                            )));
                              });
                            });
                          },
                          child: SizedBox(
                            height: size.height / 10,
                            child: Center(
                              child: ListTile(
                                  leading: Container(
                                    width: size.width / 7,
                                    height: size.height / 5,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: Center(
                                      child: Container(
                                        key: itemKeys[index],
                                        child: Text(
                                          'IMAGE',
                                          style: TextStyle(
                                              fontFamily: 'SFCompactRounded',
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // leading: Image.asset(),
                                  title: Text('Name',
                                      style: TextStyle(
                                        fontFamily: 'SFCompactRounded',
                                        fontWeight: FontWeight.w900,
                                        fontSize: size.height / 35,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                  trailing: Text("Price",
                                      style: TextStyle(
                                          fontFamily: 'SFCompactRounded',
                                          fontSize: size.height / 50,
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary))),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                      .animate()
                      .fade(
                          delay: Duration(milliseconds: 1000),
                          duration: Duration(milliseconds: 500))
                      .slideY(),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: size.width / 3.7,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListOfItems(),
                            ));
                      },
                      child: Text(
                        'View More >>',
                        style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primaryContainer,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                          .animate()
                          .fade(delay: Duration(milliseconds: 1500))
                          .slideX(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
            child: GNav(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                activeColor: Theme.of(context).colorScheme.primaryContainer,
                tabBackgroundColor: Theme.of(context).colorScheme.background,
                gap: 5,
                padding: EdgeInsets.all(13),
                tabs: [
                  GButton(
                      icon: Icons.home,
                      iconColor: Theme.of(context).colorScheme.primaryContainer,
                      text: 'Home',
                      textStyle: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        // letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  GButton(
                      icon: Icons.favorite,
                      iconColor: Theme.of(context).colorScheme.primaryContainer,
                      text: 'Likes',
                      textStyle: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        // letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  GButton(
                    icon: Icons.search,
                    iconColor: Theme.of(context).colorScheme.primaryContainer,
                    text: 'Search',
                    textStyle: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      // letterSpacing: .7,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  GButton(
                      icon: Icons.shopping_cart_rounded,
                      iconColor: Theme.of(context).colorScheme.primaryContainer,
                      text: 'Cart',
                      textStyle: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        // letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                  // GButton(
                  //   icon: Icons.settings,
                  //   iconColor: Theme.of(context).colorScheme.primaryContainer,
                  //   text: 'Settings',
                  //   textStyle: TextStyle(
                  //     // letterSpacing: .7,
                  //     fontFamily: 'SFCompactRounded',
                  //     fontWeight: FontWeight.w900,
                  //     color: Theme.of(context).colorScheme.primaryContainer,
                  //   ),
                  // ),
                  // GButton(
                  //     icon: Icons.person,
                  //     iconColor: Theme.of(context).colorScheme.primaryContainer,
                  //     text: 'Profile',
                  //     textStyle: TextStyle(
                  //       fontFamily: 'SFCompactRounded',
                  //       // letterSpacing: .7,
                  //       fontWeight: FontWeight.w900,
                  //       color: Theme.of(context).colorScheme.primaryContainer,
                  //     )),
                ]),
          ),
        ).animate().fade(
            delay: Duration(milliseconds: 1700),
            duration: Duration(milliseconds: 500)),
      ),
      isLoading ? LoadingPage() : SizedBox()
    ]);
  }
}
