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
      width: size.width / 1.1,
      child: Text(
        widget.txt + ':' + widget.value,
        style: TextStyle(
            fontFamily: 'SFCompactRounded',
            fontSize: size.height / 40,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
