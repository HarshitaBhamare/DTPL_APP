import 'package:dtpl_app/Providers/msgBoxProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MsgBox extends StatelessWidget {
  AnimationController? animationController;
  MsgBox({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String msgText = context.watch<MsgBoxProvider>().msgText;
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height / 10,
          left: size.width / 20,
        ),
        child: Container(
          width: size.width / 1.1,
          height: size.height / 15,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width / 1.13,
            height: size.height / 17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    msgText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height / 50,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await animationController?.reverse().orCancel;
                    Provider.of<MsgBoxProvider>(context, listen: false)
                        .ShowHide(false, context, animationController!);
                  },
                  child: Icon(
                    Icons.cancel,
                    size: size.height / 40,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
