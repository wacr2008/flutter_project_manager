import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget flowChart({required flowInfo}){
    return RowBuilder(
        itemBuilder: (BuildContext context, int index) {
          if(index != flowInfo.length - 1){
            return Row(
              children: [
                Text(
                  flowInfo[index],
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset(
                    'assets/icons/right_arrow.svg',
                  width: 28,
                  height: 28,
                  color: Colors.black,
                )
              ],
            );
          } else {
            return Text(
                flowInfo[index],
              style: TextStyle(
                color: Colors.black,
              ),
            );
          }
        },
        itemCount: flowInfo.length);
}

class RowBuilder extends StatelessWidget {
  const RowBuilder({
    Key? key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  final IndexedWidgetBuilder? itemBuilder;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      List.generate(itemCount!, (index) => itemBuilder!(context, index))
          .toList(),
    );
  }
}