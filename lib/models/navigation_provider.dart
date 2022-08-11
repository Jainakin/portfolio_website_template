import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  bool _isAtHomeScreen = true;

  final GlobalKey headerHomeKey = GlobalKey();
  final GlobalKey headerResumeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey footerHomeKey = GlobalKey();
  final GlobalKey footerResumeKey = GlobalKey();
  final GlobalKey certificatesKey = GlobalKey();


  Future scroolToItem({required double alignment, required int duration, required int index}) async {

    List<GlobalKey> _myList = [headerHomeKey, aboutKey, footerHomeKey, footerResumeKey, headerResumeKey, certificatesKey];
    final context = _myList[index].currentContext!;

    await Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      alignment: alignment,
    );
    notifyListeners();
  }

  bool get mainScreenState {
    return _isAtHomeScreen;
  }

  void changeScreenState() {
    _isAtHomeScreen = !_isAtHomeScreen;
    notifyListeners();
  }
}
