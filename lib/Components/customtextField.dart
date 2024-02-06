import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final bool isPasswordField;
  bool show;
  final TextEditingController textEditingController;
  // final TextEditingController controller;
  MyTextField(
      {super.key,
      required this.hint,
      required this.isPasswordField,
      required this.show,
      required this.textEditingController
      // required this.controller,
      });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  void _toggleShow() {
    setState(() {
      widget.show = !widget.show;
    });
  }

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
            color: Theme.of(context).colorScheme.primary,
          ),
          obscureText: widget.isPasswordField ? !widget.show : false,
          decoration: InputDecoration(
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: widget.show
                        ? Icon(
                            Icons.visibility_off,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    onPressed: _toggleShow,
                  )
                : null,
            label: Text(
              widget.hint,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                )),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
          )),
    );
  }
}
