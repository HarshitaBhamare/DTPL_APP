import 'dart:ui';

import 'package:flutter/material.dart';

class ForstedGlass extends StatelessWidget {
  final double width, height;
  final Widget child_;
  ForstedGlass(
      {super.key,
      required this.width,
      required this.height,
      required this.child_});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
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
                border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05)
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
