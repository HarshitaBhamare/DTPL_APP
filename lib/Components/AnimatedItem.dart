import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final Widget child;
  final int delayMs;

  const AnimatedItem({Key? key, required this.child, this.delayMs = 0})
      : super(key: key);

  @override
  AnimatedItemState createState() => AnimatedItemState();
}

class AnimatedItemState extends State<AnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    // print("Start Anim");
    // startAnimation();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  void startAnimation() {
    // print("Start Anim");
    _animationController.reset(); // Add this line

    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) {
        // print("Start Ani2");

        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
