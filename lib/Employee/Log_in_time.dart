import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

class LoginTimePage extends StatelessWidget {
  final String userId;

  LoginTimePage({required this.userId});

  Future<Map<String, String>> fetchLoginTime(String userId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('InOut_timing')
          .doc(userId)
          .get();

      if (doc.exists) {
        final Timestamp? loginTimestamp = doc['login_time'] as Timestamp?;
        if (loginTimestamp != null) {
          DateTime loginTime = loginTimestamp.toDate();
          return {
            'date': '${loginTime.day}-${loginTime.month}-${loginTime.year}',
            'time':
                '${loginTime.hour}:${loginTime.minute.toString().padLeft(2, '0')}',
          };
        } else {
          return {'error': 'Login time not found.'};
        }
      } else {
        return {'error': 'No record found for this user.'};
      }
    } catch (e) {
      return {'error': 'Error fetching login time: $e'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: const Text(
          'Login Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, String>>(
        future: fetchLoginTime(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError ||
              snapshot.data == null ||
              snapshot.data!['error'] != null) {
            return Center(
              child: Text(
                snapshot.data?['error'] ?? 'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Lottie.asset(
                'assets/animations/dateandtime.json', 
                height: 250,
                width: 250,
                ),
              SizedBox(height: 40),
            Card(
              color: Colors.grey.shade200,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Login Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Date:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data!['date']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Time:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          snapshot.data!['time']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
