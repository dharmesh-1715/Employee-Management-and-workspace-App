import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/Employee/EmployeeMeetings.dart';
import 'package:flutter_application_2/EntryPage/EntryPage.dart';
import 'package:flutter_application_2/Employee/EmployeeProjects.dart';
import 'package:flutter_application_2/Employee/Log_in_time.dart';
import 'package:flutter_application_2/Employee/profile.dart';
import 'notifications.dart';
import 'Feedback.dart';

class LogoutPage extends StatefulWidget {
  final String userId;
  final String username;

  const LogoutPage({Key? key, required this.userId, required this.username})
      : super(key: key);

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> imgList = [
    'assets/quote1.png',
    'assets/quote2.png'
  ];

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logLogoutTime(BuildContext context) async {
    try {
      await _firestore.collection('InOut_timing').doc(widget.userId).update({
        'logout_time': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout time recorded successfully')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EntryPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error recording logout time: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("${widget.username}'s Workspace"),
          centerTitle: true,
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.menu_open_rounded),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome, ${widget.username}', style: TextStyle(fontSize: 18)),
                    Text('Role : Employee', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("How's the josh?", style: TextStyle(fontSize: 14)),
                    Text('Success starts with a positive mindset and relentless effort!', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(userId: widget.userId))),
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text('Log In time'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginTimePage(userId: widget.userId))),
              ),
              ListTile(
                leading: Icon(Icons.task),
                title: Text('Projects'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => E_Projects())),
              ),
              ListTile(
                leading: Icon(Icons.meeting_room_outlined),
                title: Text('Meetings'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeMeetings())),
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Training and Development'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginTimePage(userId: widget.userId))),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Feedback'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage())),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () => logLogoutTime(context),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true, enlargeCenterPage: true),
              items: imgList.map((item) => Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                ),
              )).toList(),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueGrey,
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}