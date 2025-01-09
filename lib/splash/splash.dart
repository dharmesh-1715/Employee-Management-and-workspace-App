import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/EntryPage/EntryPage.dart';

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
              Image(image: AssetImage('assets/animations/workspace.png'),height: 200,width: 200,),
              SizedBox(height: 15,),
              Text("WorkSpace.com",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w700),),
            ],
          ),
        ),
      ),
    );
  }
}