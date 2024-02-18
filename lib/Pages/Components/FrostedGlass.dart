import 'dart:ui';

import 'package:flutter/material.dart';

class ForstedGlass extends StatelessWidget {
  final double width, height;
  final Widget child_;
  final Color color;
  final double roundedRadius;
  ForstedGlass(
      {super.key,
      required this.width,
      required this.height,
      required this.child_,
      required this.color,
      required this.roundedRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(roundedRadius),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: color.withOpacity(0.2)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withOpacity(0.1),
                      Colors.black.withOpacity(0.5)
                    ]),
              ),
            ),
            Center(
              child: child_,
            )
          ],
        ),
      ),
    );
  }
}
