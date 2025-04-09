import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/EntryPage/EntryPage.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  

  @override
  State<splashscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(),));
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animations/splash_animation.json',height: 250,width: 250,),
             // SizedBox(height: 10,),
              Text("WorkSpace",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w700),),
            ],
          ),
        ),
      ),
    );
  }
}