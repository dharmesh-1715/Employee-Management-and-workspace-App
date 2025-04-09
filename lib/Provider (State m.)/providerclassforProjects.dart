import 'package:flutter/material.dart';

class ProjectProvider extends ChangeNotifier {
  List<String> _projects = []; // Holds the list of projects

  List<String> get projects => _projects;

  void addProject(String projectName) {
    _projects.add(projectName);
    notifyListeners(); // Notify listeners of the change
  }

   void removeProject(String projectName) {
    _projects.remove(projectName);
    notifyListeners(); // Notify listeners of the change
  }
}
