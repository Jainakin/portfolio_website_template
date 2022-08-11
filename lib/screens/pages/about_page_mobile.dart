import 'package:flutter/material.dart';
import 'package:portfolio_website/models/navigation_provider.dart';
import 'package:portfolio_website/components/button_2.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/screens/resume_screen.dart';
import 'package:provider/provider.dart';

class AboutPageMobile extends StatelessWidget {
  const AboutPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return Container(
          // padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          color: Colors.white,
          constraints: BoxConstraints(
            minWidth: size.width,
            minHeight: size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'A   B   O   U   T',
                  style: TextStyle(
                    fontFamily: 'SanFrancisco',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF757575),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                constraints: BoxConstraints(
                  minWidth: size.width,
                ),
                child: const Image(
                  image: AssetImage("assets/images/about_page_placeholder.jpg"),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image(
                        image: AssetImage("assets/images/vector_fade_mobile.png"),
                        height: 724 * 0.6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jeremy Avens is the author of the successful book 'Big Boss, Little Boss', and advises to organizations on how to create a motivating, creative and educating workplace.",
                              style: TextStyle(
                                fontFamily: 'SanFrancisco',
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 30),
                            const Text(
                              "I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. I’m a great place for you to tell a story and let your users know a little more about you.",
                              style: TextStyle(
                                fontFamily: 'SanFrancisco',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 50),
                            Button2(
                              title: 'See Full CV',
                              tapEvent: () {
                                scrollSectionData.changeScreenState();
                                Navigator.pushNamed(context, '/resume', arguments: "arguments data");
                                // Navigator.pushNamed(context, ResumeScreen.id);
                              },
                              fontSize: 18,
                            ),
                            SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
