import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:portfolio_website/constants.dart';
import 'package:portfolio_website/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontSize = is4K(context)
        ? 35
        : (isDesktop(context) ? 35 : (isTab(context) ? 30 : 25));

    return Container(
      color: Colors.black,
      constraints: BoxConstraints(
        minWidth: size.width,
        // minHeight: isMobile(context) ? (size.height*(4/5)) : 0,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 30, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: isMobile(context) ? 50 : 0),
            Text(
              "Let's Get in Touch",
              style: TextStyle(
                fontFamily: 'SanFrancisco',
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: isMobile(context) ? 10 : 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Link(
                  uri: Uri.parse(linkedInURL),
                  target: LinkTarget.blank,
                  builder: (context, followLink) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: followLink,
                      child: Icon(
                        FontAwesomeIcons.linkedinIn,
                        size: fontSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Link(
                  uri: Uri.parse(twitterURL),
                  target: LinkTarget.blank,
                  builder: (context, followLink) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: followLink,
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        size: fontSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Link(
                  uri: Uri.parse(instagramURL),
                  target: LinkTarget.blank,
                  builder: (context, followLink) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: followLink,
                      child: Icon(
                        FontAwesomeIcons.instagram,
                        size: fontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile(context) ? 10 : 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: is4K(context) ? 400 :(isDesktop(context) ? 400 : (isTab(context) ? 200 : 150)),
                  width:  (size.width - 90) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'mobile',
                        style: GoogleFonts.unna(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launch('tel: ${contactNumber}'),
                          child: Text(
                            contactNumber,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Image(
                  image: const AssetImage("assets/images/slant_vector.png"),
                  height: 100,
                ),
                SizedBox(width: 10),
                Container(
                  // width: is4K(context) ? 400 :(isDesktop(context) ? 400 : (isTab(context) ? 200 : 150)),
                  width:  (size.width - 90) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'email',
                        style: GoogleFonts.unna(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launch("mailto: ${emailID}?"),
                          child: Text(
                            emailID,
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: isMobile(context) ? 100 : 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\u00a9 2022 by Hardik. Crafted on ',
                  style: GoogleFonts.unna(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Link(
                  uri: Uri.parse("https://flutter.dev/"),
                  target: LinkTarget.blank,
                  builder: (context, followLink) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: followLink,
                      child: Text(
                        'Flutter.',
                        style: GoogleFonts.unna(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
