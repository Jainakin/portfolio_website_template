import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:portfolio_website/components/header.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';
import 'dart:html' as html;

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        // minHeight: size.height,
        minWidth: size.width,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main_page_placeholder.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(),
          const SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30, horizontal: is4K(context) ? 80 :(isDesktop(context) ? 60 : (isTab(context) ? 40 : 30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 2000),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Text(
                    'I Help\nOrganizations\nReshape Their\nWorkplace Culture',
                    style: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontWeight: FontWeight.w700,
                      fontSize: is4K(context) ? 100 :(isDesktop(context) ? 80 : (isTab(context) ? 60 : 40)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: isMobile(context) ? 80 : 100),
        ],
      ),
    );
  }
}
