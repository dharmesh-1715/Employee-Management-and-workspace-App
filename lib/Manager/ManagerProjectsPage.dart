// import 'package:flutter/material.dart';

// class TasksPage extends StatefulWidget {
//   const TasksPage({Key? key}) : super(key: key);

//   @override
//   _TasksPageState createState() => _TasksPageState();
// }

// class _TasksPageState extends State<TasksPage> {
//   // Simulate user role: true for manager, false for employee
//   final bool isManager = true;

//   // List to hold project names
//   List<String> projects = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade600,
//         title: const Text(
//           'Projects',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: projects.isEmpty
//           ? const Center(
//               child: Text(
//                 'No projects yet!',
//                 style: TextStyle(fontSize: 18),
//               ),
//             )
//           : ListView.builder(
//               itemCount: projects.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: ListTile(
//                     title: Text(projects[index]),
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: isManager
//           ? FloatingActionButton(
//               backgroundColor: Colors.grey.shade400,
//               onPressed: () {
//                 _addNewProject();
//               },
//               child: const Icon(Icons.add),
//             )
//           : null, // No FAB for employees
//     );
//   }

//   void _addNewProject() {
//     // Show a dialog to add a new project
//     showDialog(
//       context: context,
//       builder: (context) {
//         String newProject = '';
//         return AlertDialog(
//           title: const Text('Add New Project'),
//           content: TextField(
//             onChanged: (value) {
//               newProject = value;
//             },
//             decoration: const InputDecoration(hintText: 'Enter project name'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (newProject.isNotEmpty) {
//                   setState(() {
//                     projects.add(newProject);
//                   });
//                 }
//                 Navigator.pop(context);
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider%20(State%20m.)/providerclassforProjects.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: const Text(
          'Projects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProjectProvider>(
        builder: (context, projectProvider, child) {
          return projectProvider.projects.isEmpty
              ? const Center(
                  child: Text(
                    'No projects yet!',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: projectProvider.projects.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Text('${index + 1}',style: TextStyle(fontSize: 18),),
                        title: Text(projectProvider.projects[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red), 
                          onPressed: () {
                            projectProvider.removeProject(projectProvider.projects[index]);
                          },
                      ),
                    ));
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade400,
        onPressed: () {
          _addNewProject(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewProject(BuildContext context) {
    String newProject = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Project'),
          content: TextField(
            onChanged: (value) {
              newProject = value;
            },
            decoration: const InputDecoration(hintText: 'Enter project name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            Consumer<ProjectProvider>(
              builder: (context, projectProvider, child) {
                return TextButton(
                  onPressed: () {
                    if (newProject.isNotEmpty) {
                      projectProvider.addProject(newProject); // Update the provider
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
