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
