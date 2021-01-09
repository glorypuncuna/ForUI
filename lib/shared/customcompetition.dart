import 'package:flutter/material.dart';

class CompetitionListEntry {
  final String title, imageLocation;
  final action;

  CompetitionListEntry(this.title, this.imageLocation, this.action);
}

class CustomCompetition extends StatelessWidget {
  final CompetitionListEntry entry;

  const CustomCompetition(this.entry);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: entry.action,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: Image.asset(
              entry.imageLocation,
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
                entry.title,
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
    );
  }
}
