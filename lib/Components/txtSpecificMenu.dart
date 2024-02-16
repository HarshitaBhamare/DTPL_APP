import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextMenu extends StatefulWidget {
  String txt;
  String value;
  TextMenu({super.key, required this.txt, required this.value});

  @override
  State<TextMenu> createState() => _TextMenuState();
}

class _TextMenuState extends State<TextMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width / 1.09,
        child: Container(
          // width: size.width / 1.1,
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primaryContainer)),
          ),
          child: Row(
            children: [
              (Expanded(
                child: Text(
                  widget.txt,
                  style: TextStyle(
                      fontFamily: 'SFCompactRounded',
                      fontSize: size.height / 40,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary),
                ),
              )),
              Text(
                "  :     ",
                style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    fontSize: size.height / 40,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Expanded(
                  child: Text(
                widget.value,
                style: TextStyle(
                    fontFamily: 'SFCompactRounded',
                    fontSize: size.height / 40,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary),
              )),
            ],
          ),
        ));
  }
}
// Text(
//         widget.txt + ':' + widget.value,
      //   style: TextStyle(
      //       fontFamily: 'SFCompactRounded',
      //       fontSize: size.height / 40,
      //       letterSpacing: 1,
      //       fontWeight: FontWeight.w700,
      //       color: Theme.of(context).colorScheme.primary),
      // ),