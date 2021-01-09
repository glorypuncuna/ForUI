import 'package:flutter/material.dart';

import 'package:forui/shared/customcompetition.dart';
import 'package:forui/shared/customtitle.dart';
import 'package:forui/shared/customthread.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/listcompetition.dart';
import 'package:forui/shared/listrecruitment.dart';

class HomeRecruitment extends StatefulWidget {
  @override
  _HomeRecruitmentState createState() => _HomeRecruitmentState();
}

class _HomeRecruitmentState extends State<HomeRecruitment> {
  var _threadListView = ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        CustomThread(recruitmentList[index]),
    itemCount: recruitmentList.length,
    shrinkWrap: true,
  );

  var _competitionListView = GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1.25,
      crossAxisCount: 1,
      mainAxisSpacing: 16,
    ),
    itemCount: competitionList.length,
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index) => CustomCompetition(competitionList[index]),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          CustomTitle('Perekrutan Populer Saat Ini'),
          CustomSeparator(16),
          Center(
            child: Container(
              height: 160,
              child: _competitionListView,
            ),
          ),
          CustomSeparator(16),
          CustomTitle('Semua Perekrutan'),
          CustomSeparator(16),
          Expanded(child: _threadListView),
        ],
      ),
    );
  }
}
