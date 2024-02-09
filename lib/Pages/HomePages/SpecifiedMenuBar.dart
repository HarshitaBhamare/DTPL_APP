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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
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
              child: Image.asset('assets/images/google.png'),
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
                  width: size.width / 1,
                  height: size.height / 1.59,
                  padding:
                      EdgeInsets.all(8), // Add padding for visual appearance
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 80,
                      ),
                      SizedBox(
                        width: size.width / 1.4,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Model Name',
                            style: GoogleFonts.gowunBatang(
                              textStyle: TextStyle(
                                  fontSize: size.height / 30,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      // SizedBox(
                      //   height: size.height / 50,
                      // ),
                      SizedBox(
                        width: size.width / 1.2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'About....',
                            style: GoogleFonts.gowunBatang(
                                textStyle: TextStyle(
                                    fontSize: size.height / 40,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 3.7,
                      ),
                      SizedBox(
                        height: size.height / 12,
                        // color: Colors.amber,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width / 7,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Price',
                                  style: GoogleFonts.gowunBatang(
                                      textStyle: TextStyle(
                                          fontSize: size.height / 60,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ),
                                Text(
                                  '80.8',
                                  style: GoogleFonts.gowunBatang(
                                      textStyle: TextStyle(
                                          fontSize: size.height / 30,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width / 6.5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: size.height / 15,
                                width: size.width / 2,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      size: size.height / 25,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    SizedBox(
                                      width: size.width / 30,
                                    ),
                                    Text('Add to Cart',
                                        style: GoogleFonts.gowunBatang(
                                          textStyle: TextStyle(
                                            fontSize: size.height / 40,
                                            fontWeight: FontWeight.w800,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ).animate().fade(delay: Duration(milliseconds: 1000)).scaleX()
        ],
      ),
    );
  }
}
