import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final bool show;
  final TextEditingController textEditingController;
  // final TextEditingController controller;
  MyTextField(
      {super.key,
      required this.hint,
      required this.show,
      required this.textEditingController
      // required this.controller,
      });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(widget.textEditingController.text);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 10),
      child: TextField(
          controller: widget.textEditingController,
          style: TextStyle(
            fontSize: size.height / 60,
          ),
          obscureText: !widget.show,
          // controller: controller,
          decoration: InputDecoration(
            // disabledBorder: InputBorder.none,
            label: Text(
              widget.hint,
              // style: TextStyle(color: Color.fromARGB(255, 34, 5, 84)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  // color: Colors.deepPurple.shade500,
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  // color: Colors.deepPurple.shade500,
                  width: 2,
                )),
            // fillColor: Colors.deepPurple.shade100,
            fillColor: Color.fromRGBO(248, 247, 248, 1),
            filled: true,
          )),
    );
  }
}
