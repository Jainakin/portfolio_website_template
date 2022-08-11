import 'package:flutter/material.dart';
import 'nav_item.dart';
import 'button.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/models/navigation_provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return Container(
          padding: EdgeInsets.only(top: 20, left: 30, right: 15),
          height: double.infinity,
          color: Colors.black,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () =>
                            Scaffold.of(context).closeEndDrawer(),
                        icon: Icon(Icons.clear_rounded, size: 30,),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Button(
                    title: 'Get in touch',
                    tapEvent: () {
                      if (scrollSectionData.mainScreenState) {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.scroolToItem(
                            alignment: 1, duration: 2000, index: 2);
                      } else {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.scroolToItem(
                            alignment: 1, duration: 2000, index: 3);
                      }
                    },
                    fontSize: 20,
                  ),
                  SizedBox(height: 30),
                  NavItem(
                    title: 'Home',
                    tapEvent: () {
                      if (scrollSectionData.mainScreenState) {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.scroolToItem(
                            alignment: 0, duration: 0, index: 0);
                      } else {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.changeScreenState();
                        Navigator.pop(context);
                      }
                    },
                    fontSize: 28,
                  ),
                  SizedBox(height: 30),
                  NavItem(
                    title: 'About',
                    tapEvent: () {
                      if (scrollSectionData.mainScreenState) {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.scroolToItem(
                            alignment: 0, duration: 1000, index: 1);
                      } else {
                        Scaffold.of(context).closeEndDrawer();
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
                    fontSize: 28,
                  ),
                  SizedBox(height: 30),
                  NavItem(
                    title: 'Certificates',
                    tapEvent: () {
                      if (scrollSectionData.mainScreenState) {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.scroolToItem(
                            alignment: 0, duration: 1500, index: 5);
                      } else {
                        Scaffold.of(context).closeEndDrawer();
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
                    fontSize: 28,
                  ),
                  SizedBox(height: 30),
                  NavItem(
                    title: 'Resume',
                    tapEvent: () {
                      if (scrollSectionData.mainScreenState) {
                        Scaffold.of(context).closeEndDrawer();
                        scrollSectionData.changeScreenState();
                        Navigator.pushNamed(context, '/resume',
                            arguments: "arguments data");
                        // Navigator.pushNamed(context, ResumeScreen.id);
                      } else {
                        Scaffold.of(context).closeEndDrawer();
                      }
                    },
                    fontSize: 28,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
