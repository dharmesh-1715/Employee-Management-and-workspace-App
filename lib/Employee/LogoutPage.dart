import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Employee/EmployeeMeetings.dart';
import 'package:flutter_application_2/EntryPage/EntryPage.dart';
import 'package:flutter_application_2/Employee/EmployeeProjects.dart';
import 'package:flutter_application_2/Employee/Log_in_time.dart';
import 'package:flutter_application_2/Employee/profile.dart';
import 'notifications.dart';
import 'Feedback.dart';

class LogoutPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String userId; // User ID to uniquely identify the user
  final String username;
  
  // Accept the username and userId as parameters
  LogoutPage({required this.userId, required this.username});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void logLogoutTime(BuildContext context) async {
    try {
      // Update the logout time in the InOut_timing collection
      await _firestore
          .collection('InOut_timing')
          .doc(userId) // Use the userId as the document ID
          .update({
        'logout_time': FieldValue.serverTimestamp(), // Record logout time
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout time recorded successfully')),
      );

      // Navigate back to the EntryPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EntryPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error recording logout time: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( //used for preventing going using back nutton of mobile
      onWillPop: () async {
        // Prevent the back button action
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('$username\'s Workspace'),
          centerTitle: true,
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications,color: Colors.black,),
              onPressed: () {
                // Perform logout action and log the logout time
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsPage(),
                  ),
                );
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.menu_open_rounded),
            onPressed: () {
              // Perform logout action and log the logout time
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, $username',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Role : Employee',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'How\'s the josh?',
                      style: TextStyle(fontSize: 14),
                    ),
                    // SizedBox(height: 10),
                    Text(
                      'Success starts with a positive mindset and relentless effort!',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  // Perform logout action and log the logout time
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsPage(userId: userId),
                    ),
                  );
                },
              ),

                ListTile(
                title: Text('Log In time'),
                leading: Icon(Icons.access_time),
                onTap: () {
                  // Perform logout action and log the logout time
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginTimePage(userId: userId),
                    ),
                  );
                },
              ),

              ListTile(
                title: Text('Projects'),
                leading: Icon(Icons.task),
                onTap: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => E_Projects(),
                    ),
                  );
                },
              ),

              ListTile(
                title: Text('Meetings'),
                leading: Icon(Icons.meeting_room_outlined),
                onTap: () {
                  // Perform logout action and log the logout time
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeMeetings(),
                    ),
                  );
                },
              ),

              ListTile(
                title: Text('Training and Development'),
                leading: Icon(Icons.work),
                onTap: () {
                  // Perform logout action and log the logout time
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginTimePage(userId: userId),
                    ),
                  );
                },
              ),

              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () {
                  // Perform logout action and log the logout time
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LoginTimePage(userId: userId),
                  //   ),
                  // );
                },
              ),

              ListTile(
                title: Text('Feedback'),
                leading: Icon(Icons.feedback),
                onTap: () {
                  // Perform logout action and log the logout time
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackPage(),
                    ),
                  );
                },
              ),

              ListTile(
                title: Text('Logout',style: TextStyle(color: Colors.red),),
                leading: Icon(Icons.logout,color: Colors.red,),
                onTap: () {
                  // Perform logout action and log the logout time
                  logLogoutTime(context);
                },
              ),
              
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are logged in as $username',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     // Perform logout action and log the logout time
              //     logLogoutTime(context);
              //   },
              //   child: Text('Logout'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
