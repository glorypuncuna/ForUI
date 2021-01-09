import 'package:flutter/material.dart';

import 'package:forui/shared/customtitle.dart';
import 'package:forui/shared/customthread.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/listsurvey.dart';

class HomeSurvey extends StatefulWidget {
  @override
  _HomeSurveyState createState() => _HomeSurveyState();
}

class _HomeSurveyState extends State<HomeSurvey> {
  var _threadListView = ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        CustomThread(surveyList[index]),
    itemCount: surveyList.length,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          CustomTitle('Semua Survei'),
          CustomSeparator(16),
          Expanded(child: _threadListView),
        ],
      ),
    );
  }
}
