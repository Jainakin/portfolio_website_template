import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/components/button.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/models/navigation_provider.dart';
import 'package:portfolio_website/responsive.dart';

class CertificatePage extends StatelessWidget {
  int _index = 0;

  int scrollRightIndex() {
    if (_index == 3) {
      _index = 0;
      return _index;
    } else {
      _index += 1;
      return _index;
    }
  }

  int scrollLeftIndex() {
    if (_index == 0) {
      _index = 3;
      return _index;
    } else {
      _index -= 1;
      return _index;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController myController = ScrollController();
    final cert1 = GlobalKey();
    final cert2 = GlobalKey();
    final cert3 = GlobalKey();
    final cert4 = GlobalKey();
    List<GlobalKey> keyList = [cert1, cert2, cert3, cert4];
    double horizontalPadding = is4K(context) ? 80 :(isDesktop(context) ? 60 : (isTab(context) ? 40 : 30));
    double verticalPadding = is4K(context) ? 200 :(isDesktop(context) ? 150 : (isTab(context) ? 100 : 80));
    double boxWidth = (size.width - 50 - (2*horizontalPadding)) / 2;

    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
          constraints: BoxConstraints(
            minWidth: size.width,
            // minHeight: size.height,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'C  E  R  T  I  F  I  C  A  T  E  S',
                    style: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF757575),
                    ),
                  ),
                  // SizedBox(height: 100),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 80, bottom: 80),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: boxWidth),
                      child: const Text(
                        "I'm a paragraph. Click here to add your own text and edit me. Let your users get to know you.",
                        style: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 100),
                  Button(
                      title: 'See Full CV',
                      tapEvent: () {
                        scrollSectionData.changeScreenState();
                        Navigator.pushNamed(context, '/resume',
                            arguments: "arguments data");
                      },
                      fontSize: 18),
                ],
              ),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            myController.position.ensureVisible(
                                keyList[scrollLeftIndex()]
                                    .currentContext!
                                    .findRenderObject()!,
                                duration: Duration(milliseconds: 1500),
                                curve: Curves.easeInOutExpo);
                          },
                          child: Icon(Icons.arrow_back_ios_new_sharp,
                              color: Colors.grey, size: 25,),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        color: Colors.transparent,
                        height: 300,
                        constraints: BoxConstraints(
                            maxWidth: boxWidth - 60),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: myController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                key: cert1,
                                color: Colors.red,
                                height: 300,
                                constraints: BoxConstraints(
                                    maxWidth: boxWidth - 60),
                              ),
                              SizedBox(width: 30),
                              Container(
                                key: cert2,
                                color: Colors.blue,
                                height: 300,
                                constraints: BoxConstraints(
                                    maxWidth: boxWidth - 60),
                              ),
                              SizedBox(width: 30),
                              Container(
                                key: cert3,
                                color: Colors.pink,
                                height: 300,
                                constraints: BoxConstraints(
                                    maxWidth: boxWidth - 60),
                              ),
                              SizedBox(width: 30),
                              Container(
                                key: cert4,
                                color: Colors.purple,
                                height: 300,
                                constraints: BoxConstraints(
                                    maxWidth: boxWidth - 60),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            myController.position.ensureVisible(
                                keyList[scrollRightIndex()]
                                    .currentContext!
                                    .findRenderObject()!,
                                duration: Duration(milliseconds: 1500),
                                curve: Curves.easeInOutExpo);
                          },
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              color: Colors.grey, size: 25,),
                        ),
                      ),
                    ],
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
