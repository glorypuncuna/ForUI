import 'package:flutter/material.dart';

import 'package:forui/screens/home/homediscussion.dart';
import 'package:forui/screens/home/homerecruitment.dart';
import 'package:forui/screens/home/homesurvey.dart';
import 'package:forui/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: TabBarView(
          children: [
            HomeDiscussion(),
            HomeRecruitment(),
            HomeSurvey(),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          brightness: Brightness.dark,
          centerTitle: true,
          title: _AppBarTitle('Beranda', 1.0),
          actions: [
            _AppBarIcon(Icons.add, () => print('tes')),
            _AppBarIcon(Icons.search_outlined, () => print('tes')),
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 8),
            tabs: [
              _AppBarTitle('Diskusi', 1.25),
              _AppBarTitle('Perekrutan', 1.25),
              _AppBarTitle('Survei', 1.25),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.chat_bubble_outline_outlined,
                color: Colors.white,
              ),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}

class ForumListEntry {
  final String title, date;
  final action;

  ForumListEntry(this.title, this.date, this.action);
}

class HeadlineTitle extends StatelessWidget {
  final String title;

  HeadlineTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        title,
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomCompetition extends StatelessWidget {
  final title, imageLocation, action;

  CustomCompetition(this.title, this.imageLocation, this.action);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: action,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageLocation,
                fit: BoxFit.cover,
                height: 128,
                width: 128,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Container(
                width: 128,
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomThread extends StatelessWidget {
  final ForumListEntry entry;

  const CustomThread(this.entry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: Colors.grey[350],
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              onTap: entry.action,
              title: Text(entry.title),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  entry.date,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarIcon extends StatelessWidget {
  final icon, action;

  _AppBarIcon(this.icon, this.action);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: action,
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final String title;
  final textScale;

  _AppBarTitle(this.title, this.textScale);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: textScale,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
