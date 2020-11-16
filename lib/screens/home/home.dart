import 'package:flutter/material.dart';
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Diskusi Populer Saat Ini',
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCompetitionThumbnail(
                      'assets/images/icon_competition1.jpg',
                      'Hult Prize at Universitas Indonesia',
                      () => print('tes'),
                    ),
                    CustomCompetitionThumbnail(
                      'assets/images/icon_competition2.jpg',
                      'Jenius Hackathon',
                      () => print('tes'),
                    ),
                    CustomCompetitionThumbnail(
                      'assets/images/icon_competition3.jpg',
                      'Shopee National Data Science Challenge 2019',
                      () => print('tes'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text(
            'Beranda',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            CustomAppBarIcon(Icons.add, () => print('tes')),
            CustomAppBarIcon(Icons.search_outlined, () => print('tes')),
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 8),
            tabs: [
              Text(
                'Diskusi',
                textScaleFactor: 1.25,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rekrut',
                textScaleFactor: 1.25,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Survei',
                textScaleFactor: 1.25,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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

class CustomCompetitionThumbnail extends StatelessWidget {
  final image, title, action;

  CustomCompetitionThumbnail(this.image, this.title, this.action);

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
                image,
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
                  style: TextStyle(fontWeight: FontWeight.w300),
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

class CustomAppBarIcon extends StatelessWidget {
  final icon, action;

  CustomAppBarIcon(this.icon, this.action);

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
