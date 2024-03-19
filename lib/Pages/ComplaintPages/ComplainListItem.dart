import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ComplainListItem extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const ComplainListItem(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  _ComplainListItemState createState() => _ComplainListItemState();
}

class _ComplainListItemState extends State<ComplainListItem> {
  double width = 0;
  double height = 100;

  @override
  void initState() {
    super.initState();
    width = widget.screenWidth / 1.2;
    // Wait for the widget to build before starting the animation.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = widget.screenWidth / 1.1; // Target width
        height = widget.screenHeight / 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.screenHeight / 30,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: width, // This width changes, triggering the animation.
          height: height,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: widget.screenWidth / 8,
                      height: widget.screenHeight / 10,
                      // color: Colors.green,
                      child: Icon(
                        Icons.person,
                        size: widget.screenHeight / 30,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  Container(
                    width: widget.screenWidth / 1.8,
                    height: widget.screenHeight / 10,
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "THE MACHINE IS NOT WORKING PERFECTLY PLEASE HELP",
                            maxLines: 2,
                            minFontSize: 15,
                            maxFontSize: 20,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'SFCompactRounded',
                              fontWeight: FontWeight.w100,
                              fontSize: widget.screenHeight / 50,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          height: 40,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: AutoSizeText(
                              "Pending",
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'SFCompactRounded',
                                fontWeight: FontWeight.w100,
                                fontSize: widget.screenHeight / 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: widget.screenWidth / 8,
                      height: widget.screenHeight / 10,
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: widget.screenHeight / 35,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
