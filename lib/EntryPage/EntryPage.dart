import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Employee/LoginPage.dart';
import 'package:flutter_application_2/EntryPage/RoleBasedLogin.dart';
import 'package:flutter_application_2/Signup/SignupPage.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntryPage(),
    );
  }
}

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {

          SystemNavigator.pop();
        }),
        title: Text('Dashboard',style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade600,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
           Lottie.asset(
           'assets/animations/welcome.json',
            height: 200,
            width: 300,
            //fit: BoxFit.fill,
            repeat: true,
            reverse: true,),
            SizedBox(height: 25,),
            
            Text("Welcome to WorkSpace!",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w700),),

            SizedBox(height: 70,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
              ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlankPage()),
                  );
                },
                child: Text('Login',style: TextStyle(fontSize: 15,color: Colors.black),),
                      ),
            
            SizedBox(height: 10),
            Text("Don't have an account?",style: TextStyle(fontSize: 16,color: Colors.black),),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Sign Up',style: TextStyle(fontSize: 15,color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
