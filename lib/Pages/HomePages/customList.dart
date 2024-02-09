import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Machines',
            style: GoogleFonts.gowunBatang(
                textStyle: TextStyle(
              letterSpacing: 1,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w900,
            ))).animate().fade(delay: Duration(milliseconds: 100)).scale(),
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 11,
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height / 15,
                    width: size.width / 1.08,
                    decoration: BoxDecoration(
                        // color: Colors.pink,
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          suffixIcon: SizedBox(
                            height: size.height / 50,
                            child: SizedBox(
                              child: Image.asset(
                                'assets/images/search.png',
                                // height: 10,
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                              left: size.width / 30, top: size.height / 70),
                        ),
                      ),
                    ),
                  ).animate().fade(delay: Duration(milliseconds: 700)).scale(),
                ],
              ),
            ),
            SizedBox(
              // color: Colors.amber,
              height: size.height / 1.27,
              width: size.width / 1.03,
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
                    .fade(duration: const Duration(milliseconds: 700))
                    .slideY(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
