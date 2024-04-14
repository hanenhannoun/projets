import 'package:cv/app.dart';
import 'package:cv/base_page.dart';
import 'package:cv/page_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_page.dart';

class MySkillPage extends StatefulWidget {
  MySkillPage(GlobalKey key) : super(key: key);

  @override
  _MySkillPageState createState() => _MySkillPageState();
}

class _MySkillPageState extends State<MySkillPage> {
  Widget _buildSkillItem(Skill skill) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              skill.language,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "${skill.percent}%",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        SizedBox(height: 8),
        Stack(
          children: <Widget>[
            Container(
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            FractionallySizedBox(
              widthFactor: skill.percent / 100,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: Colors.white,

      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle("Mes competances"),
            SizedBox(height: 32),
            Text(
              SKILLS,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth;
                final widthForTablet = 500;
                final skillWidth =
                    maxWidth > widthForTablet ? (maxWidth - 24) / 2 : maxWidth;
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: skills
                      .map(
                        (it) => SizedBox(
                          width: skillWidth,
                          child: _buildSkillItem(it),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),






















    );
  }
}







class Skill {
  String language;
  int percent;

  Skill({
    required this.language,
    required this.percent,
  });
}

final skills = [
  Skill(language: "Flutter", percent: 60),
  Skill(language: "Angular", percent: 85),
  Skill(language: "Asp.Net", percent: 70),
  Skill(language: "JEE", percent: 50),
];
