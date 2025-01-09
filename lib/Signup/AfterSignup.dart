import 'package:flutter/material.dart';
import 'package:flutter_application_2/EntryPage/EntryPage.dart';
import 'package:lottie/lottie.dart';


class SignUpSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Lottie.asset(
                'assets/animations/signed_up.json',
                height: 350,
                width: 350,
                repeat: true,
                reverse: true,
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Congratulations! ',
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'You have successfully signed up!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                ),
                onPressed: () {
                  // Navigate to the Login Page (Dashboard)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntryPage(),
                      )); // Return to the previous page (Login)
                },
                child: Text('Return to Dashboard',style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
