import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mwcut/screens/collaborator/add_project_collaborator.dart';


class ProjectDetailsScreen extends StatelessWidget {
  final Project project;
  final List<Project> projects;
  

  const ProjectDetailsScreen({Key? key, required this.project, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: FutureBuilder<List<String>>(
        future: _getProjectDescriptions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final descriptions = snapshot.data!;
            return ListView.builder(
              itemCount: descriptions.length,
              itemBuilder: (context, index) {
                final description = descriptions[index];
                return ListTile(
                  title: Text(description),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<String>> _getProjectDescriptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(project.name) ?? [];
  }
}

