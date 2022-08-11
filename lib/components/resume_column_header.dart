import 'package:flutter/material.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';

class ResumeColumnHeader extends StatelessWidget {
  const ResumeColumnHeader({required this.title1, required this. title2});

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color textColor = darkBG;

    return Column(
      children: [
        Container(
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: isMobile(context) ? (size.width * 3/5) : 615,
                  height: isMobile(context) ? 80 : 160,
                  color: primaryColor,
                ),
              ),
              Positioned(
                left: is4K(context) ? 300 :(isDesktop(context) ? 200 : (isTab(context) ? 100 : 20)),
                child: RichText(
                  text: TextSpan(
                    text: title1,
                    style: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: isMobile(context) ? 30 : 50,
                      fontWeight: FontWeight.w300,
                      color: textColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: title2,
                        style: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontSize: isMobile(context) ? 30 : 50,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
