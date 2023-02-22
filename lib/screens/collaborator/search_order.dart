import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Project {
  final String name;

  Project({this.name = '', });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static Project fromMap(Map<String, dynamic> map) {
    return Project(name: map['name']);
  }
}

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  List<Project> _projects = [];
  late Project _selectedProject;

  final TextEditingController _projectNameController = TextEditingController();

  Future<void> _loadProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final projectsJson = prefs.getStringList('projects') ?? [];

    _projects = projectsJson.map((projectJson) => Project.fromMap(jsonDecode(projectJson))).toList();
  }

  Future<void> _saveProject(Project project) async {
    final prefs = await SharedPreferences.getInstance();
    final projectsJson = prefs.getStringList('projects') ?? [];

    projectsJson.add(jsonEncode(project.toMap()));
    await prefs.setStringList('projects', projectsJson);

    setState(() {
      _projects.add(project);
    });
  }

  Future<void> _addProject() async {
    final projectName = _projectNameController.text;
    final project = Project(name: projectName);

    await _saveProject(project);
    _projectNameController.clear();
  }

  @override
  void initState() {
    super.initState();
    _loadProjects().then((_) {
      setState(() {
        _selectedProject = (_projects.isNotEmpty ? _projects[0] : null)!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _projectNameController,
              decoration: const InputDecoration(
                labelText: 'Nome Do projeto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addProject,
              child: const Text('Add'),
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Select a Project: '),
                DropdownButton<Project>(
                  value: _selectedProject,
                  items: _projects.map((project) {
                    return DropdownMenuItem<Project>(
                      value: project,
                      child: Text(project.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedProject = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
