import 'dart:convert';
import 'dart:ui';
import 'package:dtpl_app/Models/FriedMachine_FrezzingMarble/FrezzingMaster.dart';
import 'package:dtpl_app/Models/FriedMachine_FrezzingMarble/Frezzing_FriedMachines.dart';
import 'package:dtpl_app/Models/FriedMachine_FrezzingMarble/FriedMachine.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/BlasterFrezzer.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/Gelato_Natural.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/HardeeMachine.dart';
import 'package:dtpl_app/Models/Gelato_Natural_Machine/PastoMagicMachine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtpl_app/Backened/Auth/FirebaseAuthService.dart';
import 'package:dtpl_app/Models/MachineModel.dart';
import 'package:dtpl_app/Models/Machines.dart';
import 'package:dtpl_app/Models/SoftMachineModel/SoftyMachine.dart';
import 'package:dtpl_app/Models/ThickShakeMachine/ThickShakeMachine.dart';
import 'package:dtpl_app/Pages/AuthPages/loadingPage.dart';
import 'package:dtpl_app/Pages/Components/FrostedGlass.dart';
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

  Future<Machines> createMachinesInstance() async {
    // Load data for each machine type
    List<SoftyMachine> softyMachinesData = await SoftyMachine()
        .loadThickShakeMachineData(); // Assuming this function exists
    List<ThickShakeMachine> thickShakeMachinesData =
        await ThickShakeMachine().loadThickShakeMachineData();
    List<PastoMagicMachine> pastomagicMachinesData =
        await PastoMagicMachine().loadThickShakeMachineData();
    List<HardeeMachine> hardeeMachineData =
        await HardeeMachine().loadThickShakeMachineData();
    List<BlasterFrezzer> blasterFrezzerData =
        await BlasterFrezzer().loadThickShakeMachineData();
    List<FriedMachine> friedMachineData =
        await FriedMachine().loadThickShakeMachineData();
    List<FrezzingMaster> frezzingMasterData =
        await FrezzingMaster().loadThickShakeMachineData();
    // Load data for other machine types similarly...

    // Create instances for composite classes
    Frezzing_FriedMachines frezzingFriedMachines = Frezzing_FriedMachines(
      friedMachines: friedMachineData, // Assuming this function exists
      frezzingMachines: frezzingMasterData, // Assuming this function exists
    );

    Gelato_Natural gelatoNaturalMachines = Gelato_Natural(
      blasterFrezzers: blasterFrezzerData, // Assuming this function exists
      hardeeMachines: hardeeMachineData, // Assuming this function exists
      pastoMagicMachines:
          pastomagicMachinesData, // Assuming this function exists
    );

    // Create the Machines instance
    Machines machines = Machines(
      softyMachines: softyMachinesData,
      frezzingfriedMachines: frezzingFriedMachines,
      gelatonaturalMachines: gelatoNaturalMachines,
      thickShakeMachines: thickShakeMachinesData,
    );

    return machines;
  }

  Future<void> uploadMachinesToFirestore(Machines machines) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    // Example upload for ThickShakeMachines
    for (var thickShakeMachine in machines.thickShakeMachines!) {
      await db
          .collection('Machines')
          .doc('ThickShake Machines')
          .collection('Models')
          .doc(thickShakeMachine.machineId!.toString())
          .set(thickShakeMachine.toJson());
    }

    for (var softyShakeMachine in machines.softyMachines!) {
      await db
          .collection('Machines')
          .doc('Softy Machines')
          .collection('Models')
          .doc(softyShakeMachine.machineId!.toString())
          .set(softyShakeMachine.toJson());
    }

    for (var pastomagicMachine
        in machines.gelatonaturalMachines!.pastoMagicMachines!) {
      await db
          .collection('Machines')
          .doc('Gelato Natural Machines')
          .collection('Pasto Magic Machines')
          .doc(pastomagicMachine.machineId!.toString())
          .set(pastomagicMachine.toJson());
    }

    for (var hardeemachine in machines.gelatonaturalMachines!.hardeeMachines!) {
      await db
          .collection('Machines')
          .doc('Gelato Natural Machines')
          .collection('Hardee Machines')
          .doc(hardeemachine.machineId!.toString())
          .set(hardeemachine.toJson());
    }

    for (var friedMachines in machines.frezzingfriedMachines!.friedMachines!) {
      await db
          .collection('Machines')
          .doc('Frezzing Fried Machines')
          .collection('Fried Machine')
          .doc(friedMachines.machineId!.toString())
          .set(friedMachines.toJson());
    }
    for (var frezzingMachines
        in machines.frezzingfriedMachines!.frezzingMachines!) {
      await db
          .collection('Machines')
          .doc('Frezzing Fried Machines')
          .collection('Frezzing Machine')
          .doc(frezzingMachines.machineId!.toString())
          .set(frezzingMachines.toJson());
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
  void initState() {
    // TODO: implement initState
    super.initState();
    // Upload();
  }

  Future<void> Upload() async {
    Machines machines = await createMachinesInstance();
    await uploadMachinesToFirestore(machines);
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
          iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.primaryContainer),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpecifiedMenuBar(
                          xPosi: x,
                          yPosi: y,
                          width: width, // Pass width
                          height: height,
                        ),
                      ));
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
        body: DecoratedBox(
          decoration: const BoxDecoration(
              //     gradient: LinearGradient(colors: [
              //   Color.fromRGBO(0, 0, 0, 1),
              //   Color.fromRGBO(23, 19, 48, 1),
              //   Color.fromRGBO(0, 5, 59, 1)
              // ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              color: Colors.white
              // image: DecorationImage(
              // image: AssetImage('assets/gradient.jpg'), fit: BoxFit.cover)
              ),
          child: Column(
            children: [
              SizedBox(
                  width: size.width / 1.04,
                  child: Text(
                    'Featured Machines :',
                    style: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: size.height / 40,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                      .animate()
                      .fade(delay: Duration(milliseconds: 500))
                      .slideY()),
              Container(
                // color: Colors.amber,
                // alignment: Alignment.center,
                child: SizedBox(
                  // alignment: Alignment.center,
                  height: size.height / 2,
                  width: size.width / 1,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Machines')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print("errr");
                          return Text('Error: ${snapshot.error}');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: Colors.green));
                        }
                        // print("Length : " +
                        // snapshot.data!.docChanges.length.toString());
                        return Container(
                            // color: Colors.amber,
                            height: size.height / 3,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                padding: EdgeInsets.only(left: 20),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot document =
                                      snapshot.data!.docs[index];
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;
                                  return Container(
                                    height: size.height / 4,
                                    // color: Colors.green,
                                    child: Row(
                                      children: [
                                        ForstedGlass(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          width: size.width / 1.1,
                                          height: size.height,
                                          roundedRadius: 15,
                                          child_: SizedBox(
                                            //width for real container,
                                            width: size.width / 1.15,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: size.height / 90,
                                                ),
                                                Container(
                                                  height: size.height / 3,
                                                  width: size.width / 1.23,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      // color: Theme.of(context)
                                                      //     .colorScheme
                                                      //     .primaryContainer,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Image.network(
                                                      data.values.elementAt(0),
                                                      fit: BoxFit.fitHeight),
                                                ),
                                                SizedBox(
                                                  height: size.height / 40,
                                                ),
                                                Container(
                                                  height: size.height / 10,
                                                  width: size.width / 1.23,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiaryContainer
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: size.height / 70,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        data.values
                                                            .elementAt(1),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SFCompactRounded',
                                                          fontSize:
                                                              size.height / 35,
                                                          // letterSpacing: .7,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .primaryContainer,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: size.height / 80,
                                                    ),
                                                    Container(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Text(
                                                        'Starts From : 1,50,000 - 3,50,000 Rs',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SFCompactRounded',
                                                          fontSize:
                                                              size.height / 50,
                                                          // letterSpacing: .7,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .tertiary,
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        index != snapshot.data!.size - 1
                                            ? SizedBox(width: size.width / 5)
                                            : SizedBox(
                                                width: size.width / 20,
                                              )
                                      ],
                                    ),
                                  );
                                }));
                      }),
                ).animate().fade(delay: Duration(milliseconds: 800)).slideX(),
              ),
              SizedBox(
                width: size.width / 1.05,
                child: Text('Machines :',
                        style: TextStyle(
                            fontFamily: 'SFCompactRounded',
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: size.height / 45,
                            fontWeight: FontWeight.w800))
                    .animate()
                    .fade(delay: const Duration(milliseconds: 800))
                    .slideY(),
              ),
              // SizedBox(height: size.height / 50),
              Container(
                width: size.width / 1.05,
                height: size.height / 5.1,
                // color: Colors.amber,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Machines')
                      .doc(
                          'Softy Machines') // You may want to make this dynamic or handle multiple machine types
                      .collection('Models')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print("Error");
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            SoftyMachine machine = SoftyMachine.fromJson(data);
                            // print("Length : " +
                            // snapshot.data!.docChanges.length.toString());
                            // Use your MachineModel to build the UI
                            data.forEach((key, value) {
                              // print("Key : $key Value : $value");
                            });
                            return Column(
                              children: [
                                ForstedGlass(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  width: size.width,
                                  height: size.height / 12,
                                  roundedRadius: 10,
                                  child_: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                      height: size.height / 11.9,
                                      child: Center(
                                        child: ListTile(
                                            leading: Container(
                                              width: size.width / 7,
                                              height: size.height / 5,
                                              color: Colors.transparent,
                                              child: Center(
                                                child: Container(
                                                    // key: itemKeys[index],
                                                    // child: Text(
                                                    //   'IMAGE',
                                                    //   style: TextStyle(
                                                    //       fontFamily:
                                                    //           'SFCompactRounded',
                                                    //       color: Theme.of(context)
                                                    //           .colorScheme
                                                    //           .primary),
                                                    // ),

                                                    child: Image.network(
                                                        machine.machineImage!
                                                            .first,
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            // leading: Image.asset(),
                                            title: Text(machine.machineName!,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'SFCompactRounded',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        size.height / 42.5,
                                                    // color: Theme.of(context)
                                                    //     .colorScheme
                                                    //     .primaryContainer,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer)),
                                            trailing: Text(
                                                machine.machinePrice!
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily:
                                                        'SFCompactRounded',
                                                    fontSize: size.height / 50,
                                                    fontWeight: FontWeight.w100,
                                                    fontStyle: FontStyle.italic,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .tertiary))),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 30,
                                )
                              ],
                            );
                          }).toList(),
                        );
                    }
                  },
                )
                    .animate()
                    .fade(
                        delay: Duration(milliseconds: 1000),
                        duration: Duration(milliseconds: 500))
                    .slideY(),
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
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
            child: GNav(
                backgroundColor: Theme.of(context).colorScheme.background,
                activeColor: Theme.of(context).colorScheme.primaryContainer,
                tabBackgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
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
