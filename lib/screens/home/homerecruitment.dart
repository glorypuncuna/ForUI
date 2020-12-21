import 'package:flutter/material.dart';

import 'package:forui/screens/home/home.dart';

class HomeRecruitment extends StatefulWidget {
  @override
  _HomeRecruitmentState createState() => _HomeRecruitmentState();
}

class _HomeRecruitmentState extends State<HomeRecruitment> {
  static final _forumListItemsData = [
    ForumListEntry(
      '[Hult Prize] Dicari anggota tim yang mahir di desain grafis',
      '4 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Jenius] PROGRAMMER NEEDED!',
      '4 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Jenius] Ada yang mahir di bidang data science dan Python?',
      '1 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Shopee] Dicari: Graphic Designer dan Programmer',
      '1 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Shopee] WANTED: BACKEND PROGRAMMER',
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
        HeadlineTitle('Perekrutan Populer Saat Ini'),
        HomeSeparator(),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomCompetition(
                'Jenius Hackathon',
                'assets/images/icon_competition2.jpg',
                () => print('tes'),
              ),
              CustomCompetition(
                'Hult Prize at Universitas Indonesia',
                'assets/images/icon_competition1.jpg',
                () => print('tes'),
              ),
              CustomCompetition(
                'Shopee National Data Science Challenge 2019',
                'assets/images/icon_competition3.jpg',
                () => print('tes'),
              ),
            ],
          ),
        ),
        HomeSeparator(),
        HeadlineTitle('Semua Post Perekrutan'),
        HomeSeparator(),
        _forumListView,
      ],
    );
  }
}
