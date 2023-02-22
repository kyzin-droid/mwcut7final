import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mwcut/screens/collaborator/add_project_collaborator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectsListScreen extends StatefulWidget {
  @override
  _ProjectsListScreenState createState() => _ProjectsListScreenState();
}

class _ProjectsListScreenState extends State<ProjectsListScreen> {
  List<Project> _projects = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final projectsJson = prefs.getString('projects');
    if (projectsJson != null) {
      final projectsMap = json.decode(projectsJson) as List<dynamic>;
      setState(() {
        _projects = projectsMap.map((projectMap) => Project.fromJson(projectMap)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projetos'),
      ),
      body: _projects.isEmpty
          ? Center(
              child: Text(
                'Não há projetos salvos',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                return ListTile(
                  title: Text(project.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailsScreen(project),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
