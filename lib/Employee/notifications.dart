import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  // Sample list of notifications (In a real app, you would fetch these from an API or database)
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'description': 'You have a new message from John.',
      'timestamp': '2025-01-02 10:30 AM',
    },
    {
      'title': 'App Update Available',
      'description': 'A new version of the app is available for download.',
      'timestamp': '2025-01-01 05:00 PM',
    },
    {
      'title': 'Reminder',
      'description': 'Don\'t forget to complete your profile.',
      'timestamp': '2025-01-01 02:00 PM',
    },
    {
      'title': 'System Alert',
      'description': 'There is a scheduled maintenance tomorrow.',
      'timestamp': '2025-01-01 09:00 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey.shade400,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                notifications[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notifications[index]['description']!),
              trailing: Text(
                notifications[index]['timestamp']!,
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
               // You can add logic to navigate to a detailed notification page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Only View Content')),
                );

              },
            ),
          );
        },
      ),
    );
  }
}