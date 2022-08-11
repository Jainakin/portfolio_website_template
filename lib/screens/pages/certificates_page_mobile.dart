import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/components/button.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/models/navigation_provider.dart';

class CertificatePageMobile extends StatelessWidget {
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

    return Consumer<NavigationProvider>(
      builder: (context, scrollSectionData, child) {
        return Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          constraints: BoxConstraints(
            minWidth: size.width,
            // minHeight: size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'C   E   R   T   I   F   I   C   A   T   E   S',
                style: TextStyle(
                  fontFamily: 'SanFrancisco',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF757575),
                ),
              ),
              SizedBox(height: 30),
              Container(
                // constraints:
                //     BoxConstraints(maxWidth: size.width / 2 - 160 - 25),
                child: const Text(
                  "I'm a paragraph. Click here to add your own text and edit me. Let your users get to know you.",
                  style: TextStyle(
                    fontFamily: 'SanFrancisco',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Button(
                title: 'See Full CV',
                tapEvent: () {
                  scrollSectionData.changeScreenState();
                  Navigator.pushNamed(context, '/resume',
                      arguments: "arguments data");
                },
                fontSize: 18,
              ),
              SizedBox(height: 50),
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
                          color: Colors.grey, size: 22,),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      height: 200,
                      // constraints:
                      //     BoxConstraints(maxWidth: size.width / 2 - 160 - 25),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: myController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              key: cert1,
                              color: Colors.red,
                              height: 200,
                              constraints: BoxConstraints(
                                  maxWidth: size.width - 20 - 44),
                            ),
                            SizedBox(width: 30),
                            Container(
                              key: cert2,
                              color: Colors.blue,
                              height: 200,
                              constraints: BoxConstraints(
                                  maxWidth: size.width - 20 - 44),
                            ),
                            SizedBox(width: 30),
                            Container(
                              key: cert3,
                              color: Colors.pink,
                              height: 200,
                              constraints: BoxConstraints(
                                  maxWidth: size.width - 20 - 44),
                            ),
                            SizedBox(width: 30),
                            Container(
                              key: cert4,
                              color: Colors.purple,
                              height: 200,
                              constraints: BoxConstraints(
                                  maxWidth: size.width - 20 - 44),
                            ),
                          ],
                        ),
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
                          color: Colors.grey, size: 22,),
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
