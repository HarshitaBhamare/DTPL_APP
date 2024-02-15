import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SpecifiedMenuBar extends StatefulWidget {
  final double xPosi;
  final double yPosi;
  final double width;
  final double height;
  const SpecifiedMenuBar({
    Key? key,
    required this.xPosi,
    required this.yPosi,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<SpecifiedMenuBar> createState() => _SpecifiedMenuBarState();
}

class _SpecifiedMenuBarState extends State<SpecifiedMenuBar> {
  bool _moveToTopRight = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a delay
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _moveToTopRight = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
            body: Stack(children: [
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              left: _moveToTopRight ? size.width / 2 - 100 : widget.xPosi,
              top: _moveToTopRight ? 150 : widget.yPosi,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                width: _moveToTopRight ? 200 : 100,
                height: _moveToTopRight ? 200 : 100,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(_moveToTopRight ? 100 : 0),
                    color: Colors.green),
              )),
        ])),
      ],
    );
  }
}
