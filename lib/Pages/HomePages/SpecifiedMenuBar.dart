// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SpecifiedMenuBar extends StatefulWidget {
//   const SpecifiedMenuBar({super.key});

//   @override
//   State<SpecifiedMenuBar> createState() => _SpecifiedMenuBarState();
// }

// class _SpecifiedMenuBarState extends State<SpecifiedMenuBar> {
//   bool _moveToTopRight = false;

//   @override
//   void initState() {
//     super.initState();
//     // Trigger the animation after a delay
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         _moveToTopRight = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Stack(
//         children: [
//           AnimatedPositioned(
//             duration: Duration(seconds: 1),
//             top: _moveToTopRight ? 0 : size.height / 4,
//             right: _moveToTopRight ? 0 : size.width / 4,
//             child: Container(
//               width: size.width / 1.3,
//               height: size.height / 2.7,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.secondary,
//                 borderRadius: BorderRadius.circular(1000),
//               ),
//             ).animate().fadeIn(duration: 500.ms).then(curve: Curves.easeOut),
//             onEnd: () {
//               // Optionally perform actions after the animation completes
//             },
//           ),
//           if (_moveToTopRight) // Display the "model" container only after the animation
//             Positioned(
//               top: size.height /
//                   2.6, // Adjust this value as needed to position the "model" container correctly
//               right: 0,
//               child: Container(
//                   // height: size.height / 1.63,
//                   width: size.width / 1.3,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context)
//                         .colorScheme
//                         .background, // Adjust the color as needed
//                     borderRadius: BorderRadius.circular(
//                         20), // Adjust the border radius as needed
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Name",
//                         style: GoogleFonts.gowunBatang(
//                           textStyle: TextStyle(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontWeight:
//                                 FontWeight.w900, // Adjust text color as needed
//                             fontSize:
//                                 size.height / 30, // Adjust font size as needed
//                           ),
//                         ),
//                         textAlign: TextAlign.center,
//                       )
//                           .animate()
//                           .fade(delay: Duration(milliseconds: 1200))
//                           .scaleX(),
//                     ],
//                   )),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecifiedMenuBar extends StatefulWidget {
  const SpecifiedMenuBar({super.key});

  @override
  State<SpecifiedMenuBar> createState() => _SpecifiedMenuBarState();
}

class _SpecifiedMenuBarState extends State<SpecifiedMenuBar> {
  bool _moveToTopRight = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a delay
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _moveToTopRight = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: _moveToTopRight ? 0 : size.height / 4,
            right: _moveToTopRight ? 0 : size.width / 4,
            child: Container(
              width: size.width / 1.3,
              height: size.height / 2.7,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(1000),
              ),
            ).animate().fadeIn(duration: 500.ms).then(curve: Curves.easeOut),
            onEnd: () {
              // Optionally perform actions after the animation completes
            },
          ),
          if (_moveToTopRight) // Display the "model" container only after the animation
            Positioned(
              top: size.height /
                  2.7, // Adjust this value as needed to position the "model" container correctly
              right: 0,
              child: Container(
                width: size.width / 1.3,
                padding: EdgeInsets.all(8), // Add padding for visual appearance
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .background, // Adjust the color as needed
                  borderRadius: BorderRadius.circular(
                      20), // Adjust the border radius as needed
                ),
                child: Text(
                  "Model",
                  style: GoogleFonts.gowunBatang(
                    textStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Adjust text color as needed
                        fontSize: size.height / 35,
                        fontWeight:
                            FontWeight.w900 // Adjust font size as needed
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ).animate().fade(delay: Duration(milliseconds: 820)).scaleX()
        ],
      ),
    );
  }
}
