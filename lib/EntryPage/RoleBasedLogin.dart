import 'package:flutter/material.dart';
import 'package:flutter_application_2/Admin/AdminLogin.dart';
import 'package:flutter_application_2/Employee/LoginPage.dart';
import 'package:flutter_application_2/Manager/ManagerLogin.dart';

class BlankPage extends StatefulWidget {
  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey.shade300, // Sets the background color
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              backgroundColor: Colors.grey.shade600,
              //automaticallyImplyLeading: true,
              title: Text(
                'Options',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => A_LoginPage()));
                            },
                            child: Image.asset(
                              'assets/admin.png',
                              height: 120,
                              width: 120,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Image.asset(
                                'assets/employee2.png',
                                height: 120,
                                width: 120,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Employee",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => M_LoginPage()),
                              );
                            },
                            child: Image.asset(
                              'assets/manager.png',
                              height: 120,
                              width: 120,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Manager",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      )),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
