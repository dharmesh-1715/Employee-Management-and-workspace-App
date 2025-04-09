import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class A_FeedbackPage extends StatefulWidget {
  const A_FeedbackPage({super.key});

  @override
  State<A_FeedbackPage> createState() => _A_FeedbackPageState();
}

class _A_FeedbackPageState extends State<A_FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Feedbacks').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data?.docs;
          return ListView.builder(
            itemCount: documents?.length,
            itemBuilder: (ctx, index) => ListTile(
              title: Text(documents?[index]['feed']),
              //subtitle: Text(documents?[index]['email']),
            ),
          );
        },
      ),
    );
  }
}