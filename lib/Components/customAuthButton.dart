import 'package:dtpl_app/Providers/buttonManager.dart';
import 'package:dtpl_app/Providers/buttonProvider.dart';
import 'package:dtpl_app/Providers/loadingProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthButtons extends StatefulWidget {
  String name;
  int id = -1;
  final VoidCallback onTap;
  final bool isAync;
  AuthButtons(
      {super.key,
      required this.name,
      required this.id,
      required this.onTap,
      required this.isAync});

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class onTAp {}

class _AuthButtonsState extends State<AuthButtons> {
  @override
  Widget build(BuildContext context) {
    Provider.of<buttonManager>(context, listen: false).UpdateContext(context);
    Size size = MediaQuery.of(context).size;
    final isclick = context.watch<buttonProvider>().isClicked;
    final currentid = context.watch<buttonProvider>().currentID;
    return InkWell(
        onTap: () async {
          setState(() {
            Provider.of<buttonProvider>(context, listen: false)
                .OnClicked(widget.id);
          });
          Provider.of<LoadingProvider>(context, listen: false).showLoading();
          await Future.delayed(Duration(milliseconds: 500));
          await Future.delayed(Duration(milliseconds: 150));
          widget.onTap();
          await Future.delayed(Duration(milliseconds: 10));
          if (!widget.isAync) {
            Provider.of<LoadingProvider>(context, listen: false).hideLoading();
          }
          Provider.of<buttonProvider>(context, listen: false)
              .OnClicked(widget.id);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: currentid == widget.id
                ? isclick
                    ? Colors.black
                    : Color.fromRGBO(248, 247, 248, 1)
                : Color.fromRGBO(248, 247, 248, 1),
            // Color.fromRGBO(248, 247, 248, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
                // color: ,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2)),
            height: size.height / 12,
            width: size.width / 1.4,
            child: Center(
              child: Text(
                widget.name,
                style: TextStyle(
                  color: currentid == widget.id
                      ? isclick
                          ? Colors.white
                          : Colors.black
                      : Colors.black,
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
