import 'package:flutter/material.dart';

// import 'package:forui/main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      // body: ListTile(
      //   leading: Icon(Icons.nightlight_round),
      //   title: Text('Tema Gelap'),
      //   trailing: Switch(
      //     value: isDarkTheme,
      //     onChanged: (val) => setState(() => isDarkTheme = val),
      //   ),
      // ),
    );
  }
}
