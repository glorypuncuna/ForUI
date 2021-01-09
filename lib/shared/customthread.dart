import 'package:flutter/material.dart';

class ThreadListEntry {
  final String title, date;
  final action;

  ThreadListEntry(this.title, this.date, this.action);
}

class CustomThread extends StatelessWidget {
  final ThreadListEntry entry;

  const CustomThread(this.entry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
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
