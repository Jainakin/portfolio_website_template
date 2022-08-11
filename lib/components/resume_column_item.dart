import 'package:flutter/material.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';

class ResumeColumnItem extends StatelessWidget {
  const ResumeColumnItem(
      {required this.timeline, required this.title, required this.description});

  final String timeline;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color textColor = darkBG;

    return Padding(
      padding: EdgeInsets.only(
          left: is4K(context)
              ? 300
              : (isDesktop(context) ? 200 : (isTab(context) ? 100 : 20)),
          right: is4K(context)
              ? 80
              : (isDesktop(context) ? 60 : (isTab(context) ? 40 : 20))),
      child: Container(
        width: is4K(context)
            ? (size.width * 0.45)
            : isDesktop(context)
                ? (size.width * 0.6)
                : isTab(context)
                    ? (size.width * 0.7)
                    : size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timeline,
              style: TextStyle(
                fontFamily: 'SanFrancisco',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: textColor,
              ),
            ),
            // SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SanFrancisco',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'SanFrancisco',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
