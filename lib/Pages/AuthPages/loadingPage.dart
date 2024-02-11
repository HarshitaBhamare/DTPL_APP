import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Color backgroundColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        backgroundColor = Colors.black87;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // Use AnimatedContainer for the background
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 150), // Duration of the animation
        color: backgroundColor, // Animated property
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Theme.of(context).colorScheme.primary, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
