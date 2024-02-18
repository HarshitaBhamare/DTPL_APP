import 'dart:convert';
import 'dart:ui';
import 'package:dtpl_app/Components/AnimatedItem.dart';
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
import 'package:dtpl_app/Providers/listViewProvider.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:dtpl_app/Providers/themeProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  GlobalKey<AnimatedItemState> animatedItemKey = GlobalKey<AnimatedItemState>();

  final ScrollController _scrollController = ScrollController();

  void startAnimation() {
    animatedItemKey.currentState?.startAnimation();
  }

  int _currentIndex = 0;
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
    _scrollController.addListener(_scrollListener);
    // Upload();
  }

  void _scrollListener() {
    double itemWidth = MediaQuery.of(context).size.width / 1.1;
    int newFirstItemIndex = (_scrollController.offset / itemWidth).floor();

    // Get the current index from the provider without listening to changes
    int currentFirstItemIndex =
        Provider.of<ListViewProvider>(context, listen: false).currentIndex;

    // Only call SetIndex if the index has actually changed
    if (newFirstItemIndex != currentFirstItemIndex) {
      Provider.of<ListViewProvider>(context, listen: false)
          .SetIndex(newFirstItemIndex);
    }
  }

  Future<void> Upload() async {
    Machines machines = await createMachinesInstance();
    await uploadMachinesToFirestore(machines);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Stream<QuerySnapshot<Object?>>? getCurrentList(int index) {
    if (index == 0) {
      return FirebaseFirestore.instance
          .collection('Machines')
          .doc(
              'Frezzing Fried Machines') // You may want to make this dynamic or handle multiple machine types
          .collection('Frezzing Machine')
          .snapshots();
    } else if (index == 1) {
      return FirebaseFirestore.instance
          .collection('Machines')
          .doc(
              'Gelato Natural Machines') // You may want to make this dynamic or handle multiple machine types
          .collection('Hardee Machines')
          .snapshots();
    } else if (index == 2) {
      return FirebaseFirestore.instance
          .collection('Machines')
          .doc(
              'Softy Machines') // You may want to make this dynamic or handle multiple machine types
          .collection('Models')
          .snapshots();
    }
    return FirebaseFirestore.instance
        .collection('Machines')
        .doc(
            'ThickShake Machines') // You may want to make this dynamic or handle multiple machine types
        .collection('Models')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isLoading = context.watch<LoadingProvider>().isLoading;
    // final currentMyIndex = context.watch<ListViewProvider>().currentIndex;
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          actions: [],
          iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.primaryContainer),
          title: Image.asset(
            'assets/images/logodtpl.png',
            height: size.height / 10,
          ),
          // title: Text('DTPL',
          //     style: TextStyle(
          //       fontFamily: 'SFCompactRounded',
          //       letterSpacing: 5,
          //       color: Theme.of(context).colorScheme.primaryContainer,
          //       fontWeight: FontWeight.w900,
          //     )).animate().fade(delay: Duration(milliseconds: 100)).scale(),
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
                      'Rohan Gajjar',
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            SizedBox(
                width: size.width / 1.04,
                child: Center(
                  child: Text(
                    'Featured Machines ',
                    style: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: size.height / 32.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ).animate().fade(delay: Duration(milliseconds: 500)).slideY(),
                )),
            SizedBox(
              height: size.height / 60,
            ),
            Container(
              // color: Colors.green,
              width: size.width,
              height: size.height / 2.1,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Machines')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("errr");
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.green));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    controller: _scrollController,
                    padding: const EdgeInsets.only(left: 20),
                    itemBuilder: (context, index) {
                      // currentIndex = index;
                      // Provider.of<ListViewProvider>(context, listen: false)
                      //     .SetIndex(index);
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return Row(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                // color: Colors.red,
                                width: size.width / 1.1,
                                height: size.height,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          // Top left shadow - Simulates the light source from top left
                                          BoxShadow(
                                            color: Colors.white.withOpacity(
                                                0.5), // Lighter shadow color
                                            blurRadius: 15,
                                            offset: Offset(-5, -5),
                                          ),
                                          // Bottom right shadow - Simulates the shadow created by the light
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                                0.2), // Darker shadow color for depth
                                            blurRadius: 15,
                                            offset: Offset(5, 5),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                      ),
                                      height: size.height / 2.2,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: size.height / 50,
                                          ),
                                          Container(
                                            // color: Colors.green,
                                            width: size.width,
                                            height: size.height / 3.5,
                                            child: Image.network(
                                              data.values.elementAt(0),
                                              fit: BoxFit.contain,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child; // image is fully loaded
                                                } else {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height / 50,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                                // .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: size.width / 1.3,
                                            height: size.height / 9,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: size.height / 70,
                                                ),
                                                Text(
                                                  data.values.elementAt(1),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SFCompactRounded',
                                                    fontSize: size.height / 35,
                                                    // letterSpacing: .7,
                                                    fontWeight: FontWeight.w900,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height / 80,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
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
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                )),
                          ),
                          index != snapshot.data!.size - 1
                              ? SizedBox(width: size.width / 5)
                              : SizedBox(
                                  width: size.width / 20,
                                )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            // dot container....
            Container(
              width: 100,
              height: 10,
              // color: Colors.black,
            ),
            // SizedBox(
            //   height: size.height / 50,
            // ),
            Column(
              children: [
                SizedBox(
                  width: size.width / 1.05,
                  child: Center(
                    child: Text('Softy Machines ',
                            style: TextStyle(
                                fontFamily: 'SFCompactRounded',
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: size.height / 32.5,
                                fontWeight: FontWeight.w800))
                        .animate()
                        .fade(delay: const Duration(milliseconds: 800))
                        .slideY(),
                  ),
                ),
                SizedBox(
                  height: size.height / 100,
                ),
                Container(
                    width: size.width,
                    height: size.height / 5.1,
                    // color: Colors.amber,
                    child: Consumer<ListViewProvider>(
                      builder: (context, value, child) {
                        // print("I AM REBUILDING THIS SHTI AGAIN");
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (animatedItemKey.currentState != null) {
                            animatedItemKey.currentState!.startAnimation();
                          }
                        });
                        return AnimatedItem(
                            key: animatedItemKey,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: getCurrentList(value.currentIndex),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  print("Error");
                                  return Text('Error: ${snapshot.error}');
                                }
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                        child: CircularProgressIndicator());
                                  default:
                                    return ListView(
                                      children: snapshot.data!.docs
                                          .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data()! as Map<String, dynamic>;
                                        // SoftyMachine machine =
                                        //     SoftyMachine.fromJson(data);
                                        final machine;
                                        if (value.currentIndex == 0) {
                                          machine =
                                              FrezzingMaster.fromJson(data);
                                        } else if (value.currentIndex == 1) {
                                          machine =
                                              HardeeMachine.fromJson(data);
                                        } else if (value.currentIndex == 2) {
                                          machine = SoftyMachine.fromJson(data);
                                        } else {
                                          machine =
                                              ThickShakeMachine.fromJson(data);
                                        }
                                        // print("Length : " +
                                        // snapshot.data!.docChanges.length.toString());
                                        // Use your MachineModel to build the UI
                                        data.forEach((key, value) {
                                          // print("Key : $key Value : $value");
                                        });
                                        return Column(
                                          children: [
                                            Container(
                                              width: size.width / 1.1,
                                              height: size.height / 12,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    // Top left shadow - Simulates the light source from top left
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(
                                                              0.5), // Lighter shadow color
                                                      blurRadius: 15,
                                                      offset: Offset(-5, -5),
                                                    ),
                                                    // Bottom right shadow - Simulates the shadow created by the light
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(
                                                              0.2), // Darker shadow color for depth
                                                      blurRadius: 15,
                                                      offset: Offset(5, 5),
                                                    ),
                                                  ],
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondaryContainer),
                                              child: InkWell(
                                                onTap: () {},
                                                child: SizedBox(
                                                  height: size.height / 11.9,
                                                  child: Center(
                                                    child: ListTile(
                                                        leading: Container(
                                                          width: size.width / 7,
                                                          height:
                                                              size.height / 5,
                                                          // color: Colors.amber,
                                                          child: Center(
                                                            child:
                                                                Image.network(
                                                              machine
                                                                  .machineImage!
                                                                  .first,
                                                              fit: BoxFit.cover,
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child; // image is fully loaded
                                                                } else {
                                                                  return Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .secondary,
                                                                      value: loadingProgress.expectedTotalBytes !=
                                                                              null
                                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                                              loadingProgress.expectedTotalBytes!
                                                                          : null,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        // leading: Image.asset(),
                                                        title: Text(
                                                            machine
                                                                .machineName!,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'SFCompactRounded',
                                                                fontWeight: FontWeight
                                                                    .w700,
                                                                fontSize: size.height /
                                                                    42.5,
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
                                                                fontSize: size.height /
                                                                    50,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                                color: Theme.of(context)
                                                                    .colorScheme
                                                                    .tertiary))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height / 50,
                                            )
                                          ],
                                        );
                                      }).toList(),
                                    );
                                }
                              },
                            )
                            //     .animate()
                            //     .fade(
                            //         delay: Duration(milliseconds: 1000),
                            //         duration: Duration(milliseconds: 500))
                            //     .slideY(),
                            );
                      },
                    )),
              ],
            ),
          ],
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
