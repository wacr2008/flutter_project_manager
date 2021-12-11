import 'dart:math';

import 'package:flutter/cupertino.dart';

/// 翻转卡片
class FlipCard extends StatefulWidget {
  final Widget frontComponent;
  final Widget backComponent;
  bool isFront;

  FlipCard(
      {Key? key, required this.frontComponent, required this.backComponent, required this.isFront})
      : super(key: key);

  @override
  FlipCardState createState() => FlipCardState(isFront: this.isFront);
}

class FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late Animation<double> frontAnimation;
  late Animation<double> backAnimation;
  bool isFront; // 默认一开始front朝前
  bool hasHalf = false;

  FlipCardState({Key? key, required this.isFront});
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController.addListener(() {
      if (animationController.value > 0.5) {
        if (hasHalf == false) {
          isFront = !isFront;
        }
        hasHalf = true;
      }
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        hasHalf = false;
      }
    });
    frontAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.0, 0.5, curve: Curves.easeIn)));
    backAnimation = Tween(begin: 1.5, end: 2.0).animate(CurvedAnimation(
        parent: animationController,
        curve: new Interval(0.5, 1.0, curve: Curves.easeOut)));
  }

  animate() {
    animationController.stop();
    animationController.value = 0;
    animationController.forward();
  }

  changeCard() {

  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = 0;
    if (animationController.status == AnimationStatus.forward) {
      if (hasHalf == true) {
        value = backAnimation.value;
      } else {
        value = frontAnimation.value;
      }
    }
    return GestureDetector(
      onDoubleTap: () {
        animate();
      },
      child: Container(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * value),
          alignment: Alignment.center,
          child: IndexedStack(
            index: isFront ? 0 : 1,
            children: [widget.frontComponent, widget.backComponent],
          ),
        ),
      ),
    );
  }
}
