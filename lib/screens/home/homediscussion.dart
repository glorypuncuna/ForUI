import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:forui/shared/customcompetition.dart';
import 'package:forui/shared/customtitle.dart';
import 'package:forui/shared/customthread.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/listcompetition.dart';
import 'package:forui/shared/listdiscussion.dart';

bool showAppbar = true;

class HomeDiscussion extends StatefulWidget {
  @override
  _HomeDiscussionState createState() => _HomeDiscussionState();
}

class _HomeDiscussionState extends State<HomeDiscussion> {
  var _threadListView = ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        CustomThread(discussionList[index]),
    itemCount: discussionList.length,
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
          CustomTitle('Diskusi Populer Saat Ini'),
          CustomSeparator(16),
          Center(
            child: Container(
              height: 160,
              child: _competitionListView,
            ),
          ),
          CustomSeparator(16),
          CustomTitle('Semua Diskusi'),
          CustomSeparator(16),
          Expanded(child: _threadListView),
        ],
      ),
    );
  }
}
