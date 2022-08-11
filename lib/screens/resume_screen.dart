import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/screens/pages/cv_page_mobile.dart';
import 'pages/cv_page.dart';
import 'package:portfolio_website/components/header.dart';
import 'package:portfolio_website/components/footer.dart';
import 'package:portfolio_website/components/side_menu.dart';
import 'package:portfolio_website/models/navigation_provider.dart';
import 'package:provider/provider.dart';

class ResumeScreen extends StatelessWidget {
  static String id = 'resume';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return Scaffold(
          endDrawer: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height,
              maxWidth: size.width * (2 / 3),
            ),
            child: SideMenu(),
          ),
          floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.black,
            backgroundColor: primaryColor,
            child: Icon(FontAwesomeIcons.arrowUp),
            onPressed: () => scrollSectionData.scroolToItem(
                alignment: 0, duration: 500, index: 4),
          ),
          body: SingleChildScrollView(
              child: Container(
            constraints: BoxConstraints(
              minWidth: size.width,
              minHeight: size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  key: scrollSectionData.headerResumeKey,
                  child: Header(),
                ),
                Container(child: isMobile(context) ? CVPageMobile() : CVPage()),
                Container(
                    key: scrollSectionData.footerResumeKey, child: Footer()),
              ],
            ),
          )),
        );
      },
    );
  }
}
