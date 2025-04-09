import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider%20(State%20m.)/providerclassforMeeting.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import intl package

class ManagerMeeting extends StatefulWidget {
  const ManagerMeeting({super.key});

  @override
  State<ManagerMeeting> createState() => _ManagerMeetingState();
}

class _ManagerMeetingState extends State<ManagerMeeting> {
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
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            meetingProvider.removeMeeting(meeting);
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade400,
        onPressed: () {
          _addMeetingDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addMeetingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String meetingName = '';
        DateTime selectedDate = DateTime.now();
        TimeOfDay selectedTime = TimeOfDay.now();

        return StatefulBuilder(
          builder: (context, setState) {
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(selectedDate);
            String formattedTime = selectedTime.format(context);

            return AlertDialog(
              backgroundColor: Colors.white, // Cleaner background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              title: const Text(
                'Add Meeting',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Meeting Name',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                      ),
                    ),
                    onChanged: (value) {
                      meetingName = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Selected Date:',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                    ),
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Pick Date'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Selected Time:',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        formattedTime,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                    ),
                    onPressed: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    },
                    icon: const Icon(Icons.access_time),
                    label: const Text('Pick Time'),
                  ),
                ],
              ),
              actions: [
                Consumer<MeetingProvider>(
                  builder: (context, meetingProvider, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                      onPressed: () {
                        if (meetingName.isNotEmpty) {
                          final combinedDateTime = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                          meetingProvider.addMeeting(
                              meetingName, combinedDateTime);
                          Navigator.of(context).pop(); // Close the dialog
                        }
                      },
                      child: const Text(
                        'Add Meeting',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
