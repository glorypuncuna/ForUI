import 'package:flutter/material.dart';

class CustomThumbnail extends StatelessWidget {
  final title, imageLocation, action;

  CustomThumbnail(this.title, this.imageLocation, this.action);

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

