import 'package:flutter/material.dart';
import 'dart:io';

import 'package:forui/screens/forum/formForum.dart';
import 'package:forui/screens/home/homediscussion.dart';
import 'package:forui/screens/home/homerecruitment.dart';
import 'package:forui/screens/home/homesurvey.dart';
import 'package:forui/screens/profile/profile.dart';
import 'package:forui/screens/settings/settings.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/shared/customseparator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  final AuthService _auth = AuthService();

  _createThread() async =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Forum()));

  _profile() async => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Profile()));

  _settings() async => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Settings()));

  Future<bool> _exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Apakah Anda yakin ingin keluar dari ForUI?'),
        title: Text('Konfirmasi Keluar'),
        actions: [
          _CustomDialogButton('Batal', () => Navigator.pop(context)),
          _CustomDialogButton('Keluar', () => exit(0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: _exitDialog,
        child: Scaffold(
          appBar: AppBar(
            title: _AppBarTitle('Beranda', 1.0),
            actions: [
              _AppBarIcon(Icons.add, _createThread),
              _AppBarIcon(Icons.search_outlined, () => print('search')),
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
                    image: DecorationImage(
                      image: AssetImage('assets/images/header_ui.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(64),
                        child: Image.asset(
                          'assets/images/profile_placeholder.png',
                          fit: BoxFit.cover,
                          height: 96,
                          width: 96,
                        ),
                      ),
                      CustomSeparator(16),
                      Text(
                        'Nama',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.chat_bubble),
                  title: Text('Pesan'),
                ),
                ListTile(
                  onTap: _profile,
                  leading: Icon(Icons.person),
                  title: Text('Akun Anda'),
                ),
                ListTile(
                  onTap: _settings,
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

class _CustomDialogButton extends StatelessWidget {
  final hintText, action;

  _CustomDialogButton(this.hintText, this.action);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(hintText),
      onPressed: action,
    );
  }
}
