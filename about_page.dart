import 'package:cv/page_title.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'base_page.dart';
import 'data.dart';

const INTRODUCE =
    "Etudiante en génie logiciel et informatique décisionnelle , passionnée par le développement web et les nouvelles technologies Je cherche à acquérir une bonne expérience professionnelle et à découvrir les  nouvelles tendances";

const SKILLS = """
+Développement d'une application de
gestion des permis et carte grise:
Framework laravel

+Développement d'une application mobile
pour la création d'un CV: Framework flutter

+Développement d'une application Ecommerce: Framework angular
+Développement d'une application pour la
+gestion des enseignants et leurs autorisations de congé: jee
+Développement d'une application de gestion de librairie:C#/asp.net

""";



const EXP = """
+Projet de Fin d'Année PFA
Depuis mars 2023 Institut international de Technologies de Sfax, Tunisie
Système de détection des comportements anormaux des conducteurs (Deep Learing)


+Stagiaire
Depuis décembre 2022 EXADEV Sfax Sfax, Tunisie
Développement d'une plateforme de recrutement: Framework laravel

+Stagiaire
De juillet 2020 à août 2020 EMworkes Tataouine, Tunisie
Réalisation d'un système de gestion d'un boutique en ligne: Framework laravel

+Stagiaire
De février 2021 à juin 2021 Agence News Press Sfax, Tunisie
Intégration d'un outil de storytelling au sein d'un site web

""";



const AVATAR_SIZE = 108.0;

class AboutPage extends StatelessWidget {
  final VoidCallback? downloadCV;
  final VoidCallback? hireMe;

  AboutPage(GlobalKey key, this.downloadCV, this.hireMe) : super(key: key);

  Widget _multiChildLayout({
    required bool forTablet,
    required List<Widget> children,
  }) {
    Widget result;
    if (!forTablet) {
      result = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      result = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return result;
  }

  bool _isTabletSize(double maxWidth) {
    return maxWidth > 4 * AVATAR_SIZE;
  }

  Widget _buildInfoLine(String field, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "$field: ",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final isTabletSize = _isTabletSize(maxWidth);
            const avatarSize = 108.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageTitle("Apropos de nous..."),
                SizedBox(height: 32),
                _multiChildLayout(
                  forTablet: isTabletSize,
                  children: <Widget>[
                    SizedBox(width: 16),
                    SizedBox(
                      width: avatarSize,
                      height: avatarSize,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Data.AVATAR),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 36, height: 32),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Ayat&Hanen",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            INTRODUCE,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 24),
                          LayoutBuilder(
                            builder: (_, constrains) => Wrap(
                              direction: Axis.horizontal,
                              children: Data.ABOUT_PAGE_INFO.entries
                                  .toList()
                                  .map((pair) => SizedBox(
                                      width: isTabletSize
                                          ? constrains.maxWidth / 2
                                          : constrains.maxWidth,
                                      child:
                                          _buildInfoLine(pair.key, pair.value)))
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 36, height: 16),
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
                                    Icon(
                                      Icons.file_download,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Téléchargez mon CV en pdf",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical: 20,
                                ),
                                onPressed: hireMe,
                                color: MAIN_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Embauchez moi",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
