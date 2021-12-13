import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.enableCentralTitle,
    required this.paiChartSelectionDatas,
    this.centralSubTitle = '',
    this.centralTitle = ''
  }) : super(key: key);

  final List<PieChartSectionData> paiChartSelectionDatas;
  final bool enableCentralTitle ;
  final String centralTitle ;
  final String centralSubTitle ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
          if(enableCentralTitle)
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: defaultPadding),
                  Text(
                    centralTitle,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 0.5,
                    ),
                  ),
                  Text(centralSubTitle)
                ],
              ),
            ),
        ],
      ),
    );
  }
}


