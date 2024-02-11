import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
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
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isLoading = context.watch<LoadingProvider>().isLoading;

    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      child: Stack(children: [
        Scaffold(
          appBar: AppBar(
            // leading: InkWell(
            //     onTap: () {},
            //     child: Icon(
            //       Icons.menu,
            //       color: Theme.of(context).colorScheme.primaryContainer,
            //       size: size.height / 30,
            //     )),
            automaticallyImplyLeading: false,
            actions: [
              InkWell(
                splashColor: ThemeNotifier.isDark
                    ? Theme.of(context).colorScheme.background
                    : Colors.white.withOpacity(0.9),
                onTap: () async {
                  final themeNotifier =
                      Provider.of<ThemeNotifier>(context, listen: false);
                  themeNotifier.updateTheme();
                },
                child: SizedBox(
                  width: size.width / 9,
                  child: Icon(
                    ThemeNotifier.isDark
                        ? Icons.nights_stay_outlined
                        : Icons.wb_sunny_outlined,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    size: size.height / 30,
                  ),
                ).animate().fade(delay: Duration(milliseconds: 450)).slideX(),
              ),
              InkWell(
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
                child: SizedBox(
                  width: size.width / 6,
                  child: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    size: size.height / 30,
                  ),
                ).animate().fade(delay: Duration(milliseconds: 450)).slideX(),
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.background,
            // centerTitle: true,
            title: Text('DTPL',
                style: TextStyle(
                  fontFamily: 'SFCompactRounded',
                  letterSpacing: 2,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontWeight: FontWeight.w900,
                )).animate().fade(delay: Duration(milliseconds: 100)).scale(),
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
                  onTap: () {
                    print('Menu open');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpecifiedMenuBar()));
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'IMAGE',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
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
                      itemBuilder: (ctx, int) {
                        return Card(
                          margin: EdgeInsets.all(5),
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
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
                        iconColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        text: 'Home',
                        textStyle: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          // letterSpacing: .7,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                    GButton(
                        icon: Icons.favorite,
                        iconColor:
                            Theme.of(context).colorScheme.primaryContainer,
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
                        iconColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        text: 'Cart',
                        textStyle: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          // letterSpacing: .7,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                    GButton(
                      icon: Icons.settings,
                      iconColor: Theme.of(context).colorScheme.primaryContainer,
                      text: 'Settings',
                      textStyle: TextStyle(
                        // letterSpacing: .7,
                        fontFamily: 'SFCompactRounded',
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    GButton(
                        icon: Icons.person,
                        iconColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        text: 'Profile',
                        textStyle: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          // letterSpacing: .7,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ]),
            ),
          ).animate().fade(
              delay: Duration(milliseconds: 1700),
              duration: Duration(milliseconds: 500)),
        ),
        isLoading ? LoadingPage() : SizedBox()
      ]),
    );
  }
}
