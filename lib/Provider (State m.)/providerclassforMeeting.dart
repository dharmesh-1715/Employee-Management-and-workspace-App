import 'package:flutter/material.dart';


class Meeting {
  final String name;
  final DateTime dateTime;

  Meeting({required this.name, required this.dateTime});
}


class MeetingProvider extends ChangeNotifier {
  List<Meeting> _meetings = []; // Holds the list of projects

  List<Meeting> get meetings => _meetings;

  void addMeeting(String meetingName,DateTime datetime) {
    _meetings.add(Meeting(name: meetingName, dateTime: datetime));
    notifyListeners(); // Notify listeners of the change
  }

   void removeMeeting(Meeting meeting) {
    _meetings.remove(meeting);
    notifyListeners(); // Notify listeners of the change
  }
}
