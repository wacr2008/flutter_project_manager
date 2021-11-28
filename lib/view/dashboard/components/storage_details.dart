import 'package:admin/view/components/info_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../components/chart.dart';

class StorageDetails extends StatelessWidget {
   StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Storage Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(
            enableCentralTitle: true,
            paiChartSelectionDatas: paiChartSelectionDatas,
            centralTitle: '共计',
            centralSubTitle: 'xxx条',
          ),
          InfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Documents Files",
            amount: "1.3GB",
            subTitle: '1328',
          ),
          InfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Media Files",
            amount: "15.3GB",
            subTitle: '1328',
          ),
          InfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Other Files",
            amount: "1.3GB",
            subTitle: '1328',
          ),
          InfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Unknown",
            amount: "1.3GB",
            subTitle: '140',
          ),
        ],
      ),
    );
  }
  final List<PieChartSectionData> paiChartSelectionDatas = [
    PieChartSectionData(
      color: primaryColor,
      value: 25,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: Color(0xFF26E5FF),
      value: 20,
      showTitle: false,
      radius: 22,
    ),
    PieChartSectionData(
      color: Color(0xFFFFCF26),
      value: 10,
      showTitle: false,
      radius: 19,
    ),
    PieChartSectionData(
      color: Color(0xFFEE2727),
      value: 15,
      showTitle: false,
      radius: 16,
    ),
    PieChartSectionData(
      color: primaryColor.withOpacity(0.1),
      value: 25,
      showTitle: false,
      radius: 13,
    ),
  ];
}
