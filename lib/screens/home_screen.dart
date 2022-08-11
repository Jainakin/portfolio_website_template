import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/screens/pages/about_page.dart';
import 'package:portfolio_website/screens/pages/about_page_mobile.dart';
import 'package:portfolio_website/screens/pages/certificates_page.dart';
import 'package:portfolio_website/screens/pages/certificates_page_mobile.dart';
import 'package:portfolio_website/screens/pages/main_page.dart';
import 'package:portfolio_website/components/footer.dart';
import 'package:portfolio_website/components/side_menu.dart';
import 'package:portfolio_website/models/navigation_provider.dart';
import 'package:parallax_animation/parallax_animation.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return SafeArea(
          child: Scaffold(
            endDrawerEnableOpenDragGesture: false,
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
                  alignment: 0, duration: 1000, index: 0),
            ),
            body: ParallaxArea(
              child: SingleChildScrollView(
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
                        key: scrollSectionData.headerHomeKey,
                        child: MainPage(),
                      ),
                      Container(
                          key: scrollSectionData.aboutKey,
                          child: isMobile(context)
                              ? AboutPageMobile()
                              : AboutPage()),
                      ParallaxWidget(
                        inverted: true,
                        alignment: Alignment.topCenter,
                        fixedHorizontal: true,
                        overflowHeightFactor: 1.8,
                        background: Image.asset(
                          "assets/images/parallax_top.jpg",
                          fit: BoxFit.cover,
                        ),
                        child: Container(
                          // color: Colors.black.withOpacity(0.4),
                          width: size.width,
                          height: is4K(context)
                              ? 500
                              : (isDesktop(context)
                                  ? 450
                                  : (isTab(context) ? 400 : 300)),
                        ),
                      ),
                      Container(
                        key: scrollSectionData.certificatesKey,
                        child: isMobile(context)
                            ? CertificatePageMobile()
                            : CertificatePage(),
                      ),
                      ParallaxWidget(
                        inverted: true,
                        alignment: Alignment.topCenter,
                        fixedHorizontal: true,
                        overflowHeightFactor: 1.8,
                        background: Image.asset(
                          "assets/images/parallax_bottom.jpg",
                          fit: BoxFit.cover,
                        ),
                        child: Container(
                          // color: Colors.black.withOpacity(0.4),
                          width: size.width,
                          height: is4K(context)
                              ? 500
                              : (isDesktop(context)
                                  ? 450
                                  : (isTab(context) ? 400 : 300)),
                        ),
                      ),
                      Container(
                          key: scrollSectionData.footerHomeKey,
                          child: Footer()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
