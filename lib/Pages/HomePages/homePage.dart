import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
// import 'package:dtpl_app/Components/customMenuImg.dart';
import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/HomePages/SpecifiedMenuBar.dart';
import 'package:dtpl_app/Pages/HomePages/customList.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/animation.dart';
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: size.width / 6,
            child: Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: size.height / 30,
            ),
          ).animate().fade(delay: Duration(milliseconds: 450)).slideX(),
          InkWell(
            onTap: () async {
              FirebaseAuthService().signOut(context);
              await FirebaseAuth.instance.signOut();
            },
            child: SizedBox(
              width: size.width / 6,
              child: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
                size: size.height / 30,
              ),
            ).animate().fade(delay: Duration(milliseconds: 450)).slideX(),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text('DTPL',
            style: GoogleFonts.gowunBatang(
                textStyle: TextStyle(
              letterSpacing: 1,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w900,
            ))).animate().fade(delay: Duration(milliseconds: 100)).scale(),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: size.width / 1.04,
                child: Text(
                  'Featured Machines :',
                  style: GoogleFonts.gowunBatang(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: size.height / 40,
                        fontWeight: FontWeight.w800),
                  ),
                ).animate().fade(delay: Duration(milliseconds: 500)).slideY()),
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
                    color: Theme.of(context).colorScheme.secondary,
                    child: SizedBox(
                      //width for real container
                      width: size.width / 1.3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height / 90,
                          ),
                          Container(
                            height: size.height / 4.5,
                            width: size.width / 1.4,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'IMAGE',
                              style: TextStyle(color: Colors.black),
                            )),
                            // child: Image.asset('assets/images/dtpllogo.png'),
                          ),
                          SizedBox(
                            height: size.height / 100,
                          ),
                          Container(
                            height: size.height / 20,
                            width: size.width / 1.4,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                'Name',
                                style: GoogleFonts.gowunBatang(
                                  textStyle: TextStyle(
                                    fontSize: size.height / 60,
                                    letterSpacing: .7,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 100,
                          ),
                          Container(
                            height: size.height / 20,
                            width: size.width / 1.4,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                'Price',
                                style: GoogleFonts.gowunBatang(
                                  textStyle: TextStyle(
                                    fontSize: size.height / 60,
                                    letterSpacing: .7,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 100,
                          ),
                          Container(
                            height: size.height / 14,
                            width: size.width / 1.4,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                'Specifications',
                                style: GoogleFonts.gowunBatang(
                                  textStyle: TextStyle(
                                    fontSize: size.height / 60,
                                    letterSpacing: .7,
                                    fontWeight: FontWeight.w900,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
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
              child: Text(
                'Machines :',
                style: GoogleFonts.gowunBatang(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: size.height / 45,
                        fontWeight: FontWeight.w800)),
              )
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
                      color: Theme.of(context).colorScheme.secondary,
                      child: SizedBox(
                        height: size.height / 10,
                        child: Center(
                          child: ListTile(
                              leading: Container(
                                width: size.width / 7,
                                height: size.height / 5,
                                color: Theme.of(context).colorScheme.background,
                                child: Center(
                                  child: Text(
                                    'IMAGE',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ),
                              ),
                              // leading: Image.asset(),
                              title: Text('Name',
                                  style: GoogleFonts.gowunBatang(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: size.height / 35,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  )),
                              trailing: Text("Price",
                                  style: GoogleFonts.gowunBatang(
                                    textStyle: TextStyle(
                                        fontSize: size.height / 50,
                                        fontWeight: FontWeight.w900,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ))),
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
                      style: GoogleFonts.gowunBatang(
                          textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w800,
                      )),
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
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
          child: GNav(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).colorScheme.primary,
              tabBackgroundColor: Theme.of(context).colorScheme.background,
              tabBorder:
                  Border.all(color: Colors.grey, width: 1), // tab button border
              tabShadow: [
                BoxShadow(color: Colors.grey.withOpacity(1), blurRadius: 2)
              ],
              gap: 5,
              padding: const EdgeInsets.all(13),
              tabs: [
                GButton(
                    icon: Icons.home,
                    iconColor: Theme.of(context).colorScheme.primary,
                    text: 'Home',
                    textStyle: GoogleFonts.gowunBatang(
                      textStyle: TextStyle(
                        letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),
                GButton(
                    icon: Icons.favorite,
                    iconColor: Theme.of(context).colorScheme.primary,
                    text: 'Likes',
                    textStyle: GoogleFonts.gowunBatang(
                      textStyle: TextStyle(
                        letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),
                GButton(
                    icon: Icons.search,
                    iconColor: Theme.of(context).colorScheme.primary,
                    text: 'Search',
                    textStyle: GoogleFonts.gowunBatang(
                      textStyle: TextStyle(
                        letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),
                GButton(
                    icon: Icons.settings,
                    iconColor: Theme.of(context).colorScheme.primary,
                    text: 'Settings',
                    textStyle: GoogleFonts.gowunBatang(
                      textStyle: TextStyle(
                        letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),
                GButton(
                    icon: Icons.person,
                    iconColor: Theme.of(context).colorScheme.primary,
                    text: 'Profile',
                    textStyle: GoogleFonts.gowunBatang(
                      textStyle: TextStyle(
                        letterSpacing: .7,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
