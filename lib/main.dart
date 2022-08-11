import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/resume_screen.dart';
import 'screens/home_screen.dart';
import 'models/navigation_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyWebApp());
}

class MyWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Personal Website',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/resume':
              return PageTransition(
                child: ResumeScreen(),
                type: PageTransitionType.fade,
                settings: settings,
                duration: Duration(milliseconds: 500),
              );
              break;
            case '/home':
              return PageTransition(
                child: HomeScreen(),
                type: PageTransitionType.fade,
                settings: settings,
                duration: Duration(milliseconds: 500),
              );
              break;
            default:
              return null;
          }
        },
        home: HomeScreen(),
      ),
    );
  }
}
