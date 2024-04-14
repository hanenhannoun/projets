import 'package:cv/app.dart';
import 'package:cv/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'base_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback? downloadCV;
  final VoidCallback? hireMe;

  HomePage({
    Key? key,
    this.downloadCV,
    this.hireMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return BasePage(
          color: MAIN_COLOR,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth / 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: [
                      Text(
                        " ${Data.NAME}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 54,
                        ),
                      ),
                      SizedBox(width: 4),
                      Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  Data.HOME_SENTENCE,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "- ${Data.HOME_AUTHOR} -",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[


                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 42,
                        vertical: 20,
                      ),
                      onPressed: downloadCV,
                      color: SUB_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //Icon(
                           // Icons.file_download,
                            //color: Colors.white,
                            //size: 16,
                          //),
                          SizedBox(width: 6),
                          //Text(
                            //"Download my CV",
                            //style: TextStyle(
                              //color: Colors.white,
                              //fontSize: 12,
                            //),
                          //)
                        ],
                      ),
                    ),


                    MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                      elevation: 0,
                      onPressed: hireMe,
                      color: MAIN_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Embauchez-moi",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
