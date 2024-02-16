import 'package:dtpl_app/Components/fadeinout.dart';
import 'package:dtpl_app/Components/txtSpecificMenu.dart';
import 'package:dtpl_app/Models/MachineModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MenuPage extends StatefulWidget {
  MachineModel machineModel;
  MenuPage({super.key, required this.machineModel});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Define a BoxDecoration with rounded corners
    BoxDecoration boxDecoration = BoxDecoration(
      color: Theme.of(context)
          .colorScheme
          .background, // You can change the color as needed
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), // Adjust the corner radius as needed
        topRight: Radius.circular(30),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: size.height * 0.7,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset(
                'assets/images/Machine1.png',
                fit: BoxFit.fitHeight,
              )
                  .animate()
                  .fade(
                      delay: Duration(milliseconds: 250),
                      duration: Duration(milliseconds: 400))
                  .slide(),
            ),
          ),
          SliverToBoxAdapter(
            child: SlideUpFadeInWidget(
              child: Container(
                decoration:
                    boxDecoration, // Apply rounded corners to the container
                child: Column(
                  children: [
                    Container(
                      height: size.height / 10,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Text(
                        "Soft Machine",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          fontSize: size.height / 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    ...List.generate(
                      // Use List.generate to create a list of widgets
                      12, // Replace with the actual number of TextMenu items
                      (index) => Container(
                          decoration: BoxDecoration(
                            // You can apply a different decoration for each item if needed
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              TextMenu(
                                // Replace with your actual TextMenu data
                                txt: 'Item $index',
                                value: 'Value $index',
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 16), // Add spacing at the bottom if needed
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height / 14,
        color: Theme.of(context).colorScheme.background,
        child: SlideUpFadeInWidget(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomAppBar(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer, // aa fix kar to
              child: Container(
                height: size.height / 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Price : ',
                      style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontSize: size.height / 35,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      '80.8',
                      style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontSize: size.height / 35,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: size.height / 20, // Adjust the height as needed
                        width: size.width / 2.1,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: size.height / 35,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(
                              width: size.width / 30,
                            ),
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontFamily: 'SFCompactRounded',
                                fontSize: size.height / 40,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
