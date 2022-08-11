import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/navigation_provider.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:portfolio_website/components/nav_item.dart';
import 'package:portfolio_website/components/button.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<NavigationProvider>(
        builder: (context, scrollSectionData, child) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: scrollSectionData.mainScreenState
            ? Colors.transparent
            : Color(0xFF000000),
        // color: Colors.transparent,
        constraints: BoxConstraints(
          minWidth: size.width,
          // minHeight: scrollSectionData.mainScreenState ? 0 : 150,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: is4K(context) ? 40 :(isDesktop(context) ? 30 : (isTab(context) ? 20 : 15))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  child: const Image(
                    image: AssetImage("assets/images/slant_vector.png"),
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dr. Jeremy',
                  style: TextStyle(
                    fontFamily: 'SanFrancisco',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Avens',
                  style: TextStyle(
                    fontFamily: 'SanFrancisco',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(width: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Engineer,',
                  style: TextStyle(
                    fontFamily: 'SanFrancisco',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Service Professional',
                  style: TextStyle(
                    fontFamily: 'SanFrancisco',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Spacer(),
            if (size.width >= 900)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: NavItem(
                      title: 'Home',
                      tapEvent: () {
                        if (scrollSectionData.mainScreenState) {
                          scrollSectionData.scroolToItem(
                              alignment: 0, duration: 0, index: 0);
                        } else {
                          scrollSectionData.changeScreenState();
                          // Navigator.pushNamed(context, HomeScreen.id);
                          Navigator.pop(context);
                        }
                      },
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: NavItem(
                      title: 'About',
                      tapEvent: () {
                        if (scrollSectionData.mainScreenState) {
                          scrollSectionData.scroolToItem(
                              alignment: 0, duration: 1000, index: 1);
                        } else {
                          scrollSectionData.changeScreenState();
                          Navigator.pop(context);
                          Future.delayed(
                            Duration(milliseconds: 500),
                            () {
                              scrollSectionData.scroolToItem(
                                  alignment: 0, duration: 1000, index: 1);
                            },
                          );
                        }
                      },
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: NavItem(
                      title: 'Certificates',
                      tapEvent: () {
                        if (scrollSectionData.mainScreenState) {
                          scrollSectionData.scroolToItem(
                              alignment: 0, duration: 1500, index: 5);
                        } else {
                          scrollSectionData.changeScreenState();
                          Navigator.pop(context);
                          Future.delayed(
                            Duration(milliseconds: 500),
                            () {
                              scrollSectionData.scroolToItem(
                                  alignment: 0, duration: 1500, index: 5);
                            },
                          );
                        }
                      },
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: NavItem(
                      title: 'Resume',
                      tapEvent: () {
                        if (scrollSectionData.mainScreenState) {
                          scrollSectionData.changeScreenState();
                          Navigator.pushNamed(context, '/resume',
                              arguments: "arguments data");
                          // Navigator.pushNamed(context, ResumeScreen.id);
                        }
                      },
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Button(
                      title: 'Get in touch',
                      tapEvent: () {
                        if (scrollSectionData.mainScreenState) {
                          scrollSectionData.scroolToItem(
                              alignment: 1, duration: 2000, index: 2);
                        } else {
                          scrollSectionData.scroolToItem(
                              alignment: 1, duration: 2000, index: 3);
                        }
                      },
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            if (size.width < 900)
              IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Icon(Icons.menu_rounded, size: 30),
              ),
          ],
        ),
      );
    });
  }
}
