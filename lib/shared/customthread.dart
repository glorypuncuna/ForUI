import 'package:flutter/material.dart';

class ForumListEntry {
  final String title, date;
  final action;

  ForumListEntry(this.title, this.date, this.action);
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
