
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/Provider%20(State%20m.)/providerclassforMeeting.dart';
import 'package:flutter_application_2/Provider%20(State%20m.)/providerclassforProjects.dart';
//import 'package:flutter_application_2/EntryPage/EntryPage.dart';
import 'package:flutter_application_2/splash/splash.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_application_2/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyWidget());
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProjectProvider()),
      ChangeNotifierProvider(create: (context) => MeetingProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    ),
    );
  }
}