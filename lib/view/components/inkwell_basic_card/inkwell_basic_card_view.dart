import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inkwell_basic_card_logic.dart';

class BasicCard extends StatelessWidget {
  final basicCardLogic = Get.put(BasicCardLogic());

  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Function()? onTap;


  BasicCard({
    this.shape,
    this.margin,
    this.child,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          child:Obx(()=>Card(
            color: basicCardLogic.isMoveIn.value?Colors.white70:Colors.white ,
            shape:shape==null ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))):shape, //设置圆角
            // elevation: basicCardLogic.elevation.value,
            margin: margin,
            child: child,
          ),)
        ),
        onHover: (value){
          value ? basicCardLogic.cursorMoveIn() : basicCardLogic.cursorMoveOut();
        },
    );
  }
}