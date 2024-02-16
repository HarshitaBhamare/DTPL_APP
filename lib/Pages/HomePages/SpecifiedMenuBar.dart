import 'package:dtpl_app/Components/txtSpecificMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                left: _moveToTopRight ? size.width / 2 - 100 : widget.xPosi,
                top: _moveToTopRight ? 100 : widget.yPosi,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  width: _moveToTopRight ? 200 : widget.width,
                  height: _moveToTopRight ? 200 : widget.height,
                  // child: Image.asset('assets/images/google.png'),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(_moveToTopRight ? 100 : 0),
                    color: Colors.green,
                  ),
                ),
              ),
              Positioned(
                // right: size.width / 2,
                top: (_moveToTopRight ? 100 : widget.yPosi) +
                    (_moveToTopRight
                        ? 200
                        : widget
                            .height), // 10 is an arbitrary space, adjust as needed
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Container(
                      width: size.width,
                      // color: Colors.amber,
                      padding: EdgeInsets.only(left: size.width / 3),
                      child: Text(
                        'Soft 103 / GT',
                        style: TextStyle(
                            fontFamily: 'SFCompactRounded',
                            fontSize: size.height / 30,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 75,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer))),
                      // color: Colors.green,
                      width: size.width / 1.06,
                      height: size.height / 2,
                      child: SingleChildScrollView(
                        //
                        child: Column(
                          children: [
                            TextMenu(
                              txt: 'Machine Type',
                              value: 'Softy Machine',
                            ),
                            TextMenu(
                              txt: 'Machine ID',
                              value: '101',
                            ),
                            TextMenu(
                              txt: 'Tank Capacity',
                              value: '16',
                            ),
                            TextMenu(
                              txt: 'Freezing Cylinder Capacity',
                              value: '2.4 Liters',
                            ),
                            TextMenu(
                              txt: 'Hourly Cone Output',
                              value: '160',
                            ),
                            TextMenu(
                              txt: 'Machine Overrun',
                              value: 'Gravity Feeding',
                            ),
                            TextMenu(
                              txt: 'Regular Flavour',
                              value: '2',
                            ),
                            TextMenu(
                              txt: 'Mix Flavour',
                              value: '1',
                            ),
                            TextMenu(
                              txt: 'Compressor',
                              value: '1',
                            ),
                            TextMenu(
                              txt: 'Motor',
                              value: '1',
                            ),
                            TextMenu(
                              txt: 'Power Supply',
                              value: '230 / 50 / 1 or 400 / 50 / 3 Kw. : 2.9',
                            ),
                            TextMenu(
                              txt: 'Dimension',
                              value: '840,520,875',
                            ),
                            TextMenu(
                              txt: 'GST',
                              value: '18%',
                            ),
                            TextMenu(
                              txt: 'isPacking Include',
                              value: 'False',
                            ),
                            TextMenu(
                              txt: 'isTransportation Include',
                              value: 'False',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 3.7,
                    ),
                  ],
                ),
              )
                  .animate()
                  .fade(
                      delay: Duration(milliseconds: 1000),
                      duration: Duration(milliseconds: 500))
                  .slideX(),
              // ).animate().fade(delay: Duration(milliseconds: 800)).scaleY(
              // duration: Duration(milliseconds: 300),
              // delay: Duration(milliseconds: 1200)),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).colorScheme.secondaryContainer,
            height: 10,
            child: Container(
              height: size.height / 14, //nai thai raiyu be aa to ahi
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price : ',
                    style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontSize: size.height / 35,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '80.8',
                    style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontSize: size.height / 35,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(
                    width: size.width / 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      // height: 200,
                      height: size.height,
                      width: size.width / 2.1,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: size.height / 35,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(
                            width: size.width / 30,
                          ),
                          Text('Add to Cart',
                              style: TextStyle(
                                fontFamily: 'SFCompactRounded',
                                fontSize: size.height / 40,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.primary,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
