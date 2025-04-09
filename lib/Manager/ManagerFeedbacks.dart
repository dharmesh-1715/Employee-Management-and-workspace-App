import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class M_FeedbackPage extends StatefulWidget {
  const M_FeedbackPage({super.key});

  @override
  State<M_FeedbackPage> createState() => _M_FeedbackPageState();
}

class _M_FeedbackPageState extends State<M_FeedbackPage> {
  TextEditingController feedbackController = TextEditingController();

  void add_data() async {
    try {
      if (feedbackController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please enter feedback"),
          backgroundColor: Colors.redAccent,
        ));
        return;
      }

      await FirebaseFirestore.instance
          .collection('Feedbacks')
          .add({'feed': feedbackController.text});

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Feedback Submitted Successfully!"),
        backgroundColor: Colors.blueAccent,

      )
      );
      feedbackController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error submitting feedback'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Feedback', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.grey.shade600,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How was your experience with us?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: feedbackController,
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback here',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  autocorrect: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade400,
                  ),
                  onPressed: () {
                    // Perform feedback submission action
                    // Navigator.pop(context);
                    add_data();
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
