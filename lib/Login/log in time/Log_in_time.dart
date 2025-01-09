import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginTimePage extends StatelessWidget {
  final String userId;

  LoginTimePage({required this.userId});

  Future<String?> fetchLoginTime(String userId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('InOut_timing')
          .doc(userId)
          .get();

      if (doc.exists) {
        // Assuming 'login_time' is stored as a Timestamp in Firestore
        final Timestamp? loginTimestamp = doc['login_time'] as Timestamp?;
        if (loginTimestamp != null) {
          DateTime loginTime = loginTimestamp.toDate();
          return loginTime.toString(); // Format the DateTime as needed
        } else {
          return 'Login time not found.';
        }
      } else {
        return 'No record found for this user.';
      }
    } catch (e) {
      return 'Error fetching login time: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('Login Time',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: FutureBuilder<String?>(
        future: fetchLoginTime(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available.'));
          }

          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text(
                 'Login Time & Date:',
              style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10,), 
              Text(
                 '${snapshot.data}',
              style: TextStyle(fontSize: 20),
              )
             ],
            ),
          );
        },
      ),
    );
  }
}
