import 'package:cv/app.dart';
import 'package:cv/base_page.dart';
import 'package:cv/page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_page.dart';

class ExperiencePage extends StatefulWidget {
  ExperiencePage(GlobalKey key) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("Mes Experiences"),
            SizedBox(height: 32),
            Text(
              EXP,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,

              ),
            ),
            SizedBox(height: 24),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "image/tiki.png",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "image/samsung.png",
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


