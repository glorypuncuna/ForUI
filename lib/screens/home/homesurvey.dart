import 'package:flutter/material.dart';

import 'package:forui/shared/customtitle.dart';
import 'package:forui/shared/customthread.dart';
import 'package:forui/shared/separator.dart';

class HomeSurvey extends StatefulWidget {
  @override
  _HomeSurveyState createState() => _HomeSurveyState();
}

class _HomeSurveyState extends State<HomeSurvey> {
  static final _forumListItemsData = [
    ForumListEntry(
      '[Hult Prize] Survei tentang Agrotourism',
      '4 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Hult Prize] Cara pengurangan emisi karbon',
      '4 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Hult Prize] Hubungan antara WFH dengan tingkat emisi karbon',
      '1 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Jenius] Survei tentang Struk Belanja',
      '1 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Shopee] Apakah kalian tau tentang data cleaning?',
      '30 September 2020',
      () => print('tes'),
    ),
  ];

  var _forumListView = ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        CustomThread(_forumListItemsData[index]),
    itemCount: _forumListItemsData.length,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        CustomTitle('Semua Post Survei'),
        Separator(16),
        _forumListView,
      ],
    );
  }
}
