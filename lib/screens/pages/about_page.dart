import 'package:flutter/material.dart';
import 'package:portfolio_website/models/navigation_provider.dart';
import 'package:portfolio_website/components/button_2.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double horizontalPadding = is4K(context) ? 80 :(isDesktop(context) ? 60 : (isTab(context) ? 40 : 30));
    double verticalPadding = is4K(context) ? 100 :(isDesktop(context) ? 80 : (isTab(context) ? 60 : 40));
    double boxWidth = (size.width - 50 - (2*horizontalPadding)) / 2;
    double upperText = is4K(context) ? 34 :(isDesktop(context) ? 30 : (isTab(context) ? 24 : 20));
    double lowerText = is4K(context) ? 24 :(isDesktop(context) ? 22 : (isTab(context) ? 20 : 16));
    double vectorHeight = is4K(context) ? 430 :(isDesktop(context) ? 300 : (isTab(context) ? 250 : 100));

    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
          color: Colors.white,
          constraints: BoxConstraints(
            minWidth: size.width,
            minHeight: size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'A  B  O  U  T',
                style: TextStyle(
                  fontFamily: 'SanFrancisco',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF757575),
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: boxWidth,
                    ),
                    child: Image.asset("assets/images/about_page_placeholder.jpg"),
                    ),
                  SizedBox(width: 50),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: boxWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Image(
                                image: AssetImage("assets/images/slant_vector.png"),
                                color: primaryColor.withOpacity(0.15),
                                height: vectorHeight,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 40, top: 40, bottom: 40, right: 0),
                                child: Text(
                                  "Jeremy Avens is the author of the successful book 'Big Boss, Little Boss', and advises to organizations on how to create a motivating, creative and educating workplace.",
                                  style: TextStyle(
                                    fontFamily: 'SanFrancisco',
                                    fontSize: upperText,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 40, top: 40, bottom: 40, right: 0),
                            child: Text(
                              "I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. I’m a great place for you to tell a story and let your users know a little more about you.",
                              style: TextStyle(
                                fontFamily: 'SanFrancisco',
                                fontSize: lowerText,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Button2(
                            title: 'See Full CV',
                            tapEvent: () {
                              scrollSectionData.changeScreenState();
                              Navigator.pushNamed(context, '/resume', arguments: "arguments data");
                              // Navigator.pushNamed(context, ResumeScreen.id);
                            },
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
