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
      body: Column(
        children: [
          Container(
            height: size.height / 11,
            width: size.width,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height / 15,
                  width: size.width / 1.03,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
          SizedBox(
              // height: size.height / 90,
              ),
          Container(
            color: Colors.amber,
            height: size.height / 1.3,
            width: size.width,
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
              ).animate().fade(duration: Duration(milliseconds: 700)).slideY(),
            ),
          )
        ],
      ),
    );
  }
}
