import 'package:flutter/material.dart';
import 'package:forui/screens/forum/formForum.dart';

import 'package:forui/screens/forum/formForum.dart';
import 'package:forui/screens/home/homediscussion.dart';
import 'package:forui/screens/home/homerecruitment.dart';
import 'package:forui/screens/home/homesurvey.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/shared/customcolors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  final AuthService _auth = AuthService();

  _createThread() async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Forum()));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _AppBarTitle('Beranda', 1.0),
          actions: [
            _AppBarIcon(
              Icons.add,
              _createThread,
            ),
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
        body: TabBarView(
          children: [
            HomeDiscussion(),
            HomeRecruitment(),
            HomeSurvey(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: customBlue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/header_ui.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Header'),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.chat_bubble),
                title: Text('Pesan'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Akun Anda'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Pengaturan'),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Tentang Aplikasi'),
              ),
            ],
          ),
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
    );
  }
}

class _AppBarIcon extends StatelessWidget {
  final icon, action;

  _AppBarIcon(this.icon, this.action);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: action,
    );
  }
}
