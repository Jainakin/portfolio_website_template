import 'package:flutter/material.dart';
import 'package:portfolio_website/components/button_2.dart';
import 'package:portfolio_website/components/resume_column_header.dart';
import 'package:portfolio_website/components/resume_column_item.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';

class CVPage extends StatelessWidget {
  const CVPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color textColor = darkBG;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: Colors.black, width: 1),
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
        color: Colors.white,
      ),
      // color: Colors.black,
      constraints: BoxConstraints(
        minHeight: size.height,
        minWidth: size.width,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: size.width,
            height: 195,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 800,
                    height: 160,
                    color: primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 113,
                  left: 50,
                  child: Text(
                    'CV',
                    style: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: 80,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Padding(
            padding: EdgeInsets.only(left: is4K(context) ? 300 :(isDesktop(context) ? 200 : (isTab(context) ? 100 : 25)), right: is4K(context) ? 80 :(isDesktop(context) ? 60 : (isTab(context) ? 40 : 30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Professional ',
                    style: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Summary',
                        style: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontSize: 50,
                          fontWeight: FontWeight.w300,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                const ResumePageParagraph(
                  content:
                      "I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. Feel free to drag and drop me anywhere you like on your page. I’m a great place for you to tell a story and let your users know a little more about you.\n\n\nThis is a great space to write a long text about your company and your services. You can use this space to go into a little more detail about your company. Talk about your team and what services you provide. Tell your visitors the story of how you came up with the idea for your business and what makes you different from your competitors. Make your company stand out and show your visitors who you are.",
                ),
                const SizedBox(height: 50),
                Button2(
                    title: 'Download Full CV', tapEvent: () {}, fontSize: 14),
              ],
            ),
          ),
          const SizedBox(height: 170),
          const ResumeColumnHeader(title1: '', title2: 'Education'),
          const SizedBox(height: 60),
          const ResumeColumnItem(
            timeline: '2023-2023',
            title: 'University Name',
            description:
                "I'm a paragraph. Click here to add your own text and edit me.",
          ),
          const SizedBox(height: 60),
          const ResumeColumnItem(
            timeline: '2023-2023',
            title: 'University Name',
            description:
                "I'm a paragraph. Click here to add your own text and edit me.",
          ),
          const SizedBox(height: 170),
          const ResumeColumnHeader(title1: 'Work ', title2: 'Experience'),
          const SizedBox(height: 60),
          const ResumeColumnItem(
            timeline: '2023-2023',
            title: 'Role & Company Name',
            description:
                "I'm a paragraph. Click here to add your own text and edit me. I’m a great place for you to tell a story and let your users know a little more about you.",
          ),
          const SizedBox(height: 60),
          const ResumeColumnItem(
            timeline: '2023-2023',
            title: 'Role & Company Name',
            description:
                "I'm a paragraph. Click here to add your own text and edit me. I’m a great place for you to tell a story and let your users know a little more about you.",
          ),
          const SizedBox(height: 170),
          const ResumeColumnHeader(title1: '', title2: 'Interests'),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.only(left: is4K(context) ? 300 :(isDesktop(context) ? 200 : (isTab(context) ? 100 : 25)), right: is4K(context) ? 80 :(isDesktop(context) ? 60 : (isTab(context) ? 40 : 30))),
            child: ResumePageParagraph(
              content:
                  "I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. Feel free to drag and drop me anywhere you like on your page. I’m a great place for you to tell a story and let your users know a little more about you.",
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class ResumePageParagraph extends StatelessWidget {
  const ResumePageParagraph({required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color textColor = darkBG;

    return Container(
      constraints: BoxConstraints(maxWidth: is4K(context) ? (size.width*0.45) : isDesktop(context) ? (size.width*0.6) : isTab(context) ? (size.width*0.7) : size.width),
      child: Text(
        content,
        style: TextStyle(
          fontFamily: 'SanFrancisco',
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: textColor,
        ),
      ),
    );
  }
}
