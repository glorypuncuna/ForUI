import 'package:flutter/material.dart';

import 'package:forui/screens/home/home.dart';

class HomeDiscussion extends StatefulWidget {
  @override
  _HomeDiscussionState createState() => _HomeDiscussionState();
}

class _HomeDiscussionState extends State<HomeDiscussion> {
  static final _forumListItemsData = [
    ForumListEntry(
      '[Hult Prize] Apakah kalian pernah mendengar Agrotourism?',
      '4 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Hult Prize] Pengurangan emisi karbon dengan melakukan kampanye menu tanpa daging?',
      '4 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Jenius] Apakah menurut kalian, struk belanja seharusnya disimpan?',
      '1 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Jenius] Bagaimana melakukan investasi dengan pendapatan rendah?',
      '1 Oktober 2020',
      () => print('tes'),
    ),
    ForumListEntry(
      '[Shopee] Pernahkan kalian melakukan data cleaning? PROGRAMMER NEEDED!',
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
        HeadlineTitle('Diskusi Populer Saat Ini'),
        HomeSeparator(),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomCompetition(
                'Hult Prize at Universitas Indonesia',
                'assets/images/icon_competition1.jpg',
                () => print('tes'),
              ),
              CustomCompetition(
                'Jenius Hackathon',
                'assets/images/icon_competition2.jpg',
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
        HeadlineTitle('Semua Post Diskusi'),
        HomeSeparator(),
        _forumListView,
      ],
    );
  }
}
