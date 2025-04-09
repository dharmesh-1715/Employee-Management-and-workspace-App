import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider%20(State%20m.)/providerclassforProjects.dart';
import 'package:provider/provider.dart';

class E_Projects extends StatefulWidget {
  const E_Projects({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<E_Projects> {
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: Text('${index + 1}'),
                        title: Text(projectProvider.projects[index]),
                      ),
                    );
                  },
                );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.grey.shade400,
      //   onPressed: () {
      //     _addNewProject(context);
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }

//   void _addNewProject(BuildContext context) {
//     String newProject = '';
//     showDialog(
//       context: context,
//       builder: (context) {
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
//             Consumer<ProjectProvider>(
//               builder: (context, projectProvider, child) {
//                 return TextButton(
//                   onPressed: () {
//                     if (newProject.isNotEmpty) {
//                       projectProvider.addProject(newProject); // Update the provider
//                     }
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
}