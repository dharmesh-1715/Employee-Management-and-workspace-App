import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider%20(State%20m.)/providerclassforMeeting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EmployeeMeetings extends StatefulWidget {
  const EmployeeMeetings({super.key});

  @override
  State<EmployeeMeetings> createState() => _EmployeeMeetingsState();
}

class _EmployeeMeetingsState extends State<EmployeeMeetings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: const Text(
          'Meetings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<MeetingProvider>(
        builder: (context, meetingProvider, child) {
          return meetingProvider.meetings.isEmpty
              ? const Center(
                  child: Text(
                    'No Meetings Scheduled yet!',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: meetingProvider.meetings.length,
                  itemBuilder: (context, index) {
                    final meeting = meetingProvider.meetings[index];
                    final formattedDate =
                        DateFormat('dd-MM-yyyy').format(meeting.dateTime);
                    final formattedTime =
                        DateFormat('hh:mm a').format(meeting.dateTime);

                    return Card(
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Text(
                          '${index + 1}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        title: Text(meeting.name),
                        subtitle: Text(
                          'Date: $formattedDate\nTime: $formattedTime',
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

}