import 'package:dtpl_app/Pages/ComplaintPages/ComplainListItem.dart';
import 'package:dtpl_app/Providers/complainHomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';

class ComplainHomePage extends StatefulWidget {
  const ComplainHomePage({super.key});

  @override
  State<ComplainHomePage> createState() => _ComplainHomePageState();
}

class _ComplainHomePageState extends State<ComplainHomePage> {
  bool isRaisedComplain = false;
  @override
  Widget build(BuildContext context) {
    final onComplainRegsiterPage =
        context.watch<ComplainHomeProvider>().onComplainRegsiterPage;
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            title: Center(
                child: Text("Complain Box",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      fontWeight: FontWeight.w100,
                      fontSize: size.height / 30,
                      color: Theme.of(context).colorScheme.primary,
                    ))),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.background,
            height: size.height,
            width: size.width,
            child: onComplainRegsiterPage
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: size.width, // Set the width to fill the screen
                    height: size.height / 1.15, // Adjust the height as needed
                    color: Theme.of(context).colorScheme.background,
                    alignment: Alignment.center,
                    // No need for SingleChildScrollView here because ListView.builder is scrollable
                    child: ListView.builder(
                      itemCount: 5, // Adjust itemCount as necessary
                      itemBuilder: (context, index) {
                        // Each item in the list
                        return ComplainListItem(
                          screenWidth: size.width,
                          screenHeight: size.height,
                        );
                      },
                    ),
                  )
                : Align(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isRaisedComplain = !isRaisedComplain;
                          Future.delayed(Duration(seconds: 1)).then((value) =>
                              Provider.of<ComplainHomeProvider>(context,
                                      listen: false)
                                  .OnChangePage());
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: isRaisedComplain
                            ? size.width / 8
                            : size.width / 1.5,
                        height: isRaisedComplain
                            ? size.height / 20
                            : size.height / 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(-5, -5),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              offset: Offset(5, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        child: isRaisedComplain
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              )
                            : Text(
                                "Raise a complain?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SFCompactRounded',
                                  fontWeight: FontWeight.w100,
                                  fontSize: size.height / 50,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                      ),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
