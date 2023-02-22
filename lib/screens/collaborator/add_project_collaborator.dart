import 'package:flutter/material.dart';
import 'package:mwcut/screens/collaborator/EditStepScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';

class Project {
  final String name;

  Project(this.name);

  static fromJson(json) {}
}

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Project> projects = [];

  Future<void> loadProjects() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> projectsNames = prefs.getStringList('projects') ?? [];
    setState(() {
      projects = projectsNames.map((name) => Project(name)).toList();
    });
  }

  Future<void> addProject(String projectName) async {
    final project = Project(projectName);
    setState(() {
      projects.add(project);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> projectsNames = prefs.getStringList('projects') ?? [];
    projectsNames.add(projectName);
    prefs.setStringList('projects', projectsNames);
    Navigator.pop(context);
  }

  void showAddProjectScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProjectScreen(
          onAddProject: addProject,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projetos'),
      ),
      body: projects.isEmpty
          ? Center(
              child: Text(
                'Não há projetos salvos',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ListTile(
                  title: Text(project.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProjectDetailsScreen(project),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddProjectScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddProjectScreen extends StatefulWidget {
  final void Function(String projectName) onAddProject;

  AddProjectScreen({required this.onAddProject});

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final TextEditingController _controller = TextEditingController();

  void saveProject() async {
    final projectName = _controller.text;
    widget.onAddProject(projectName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar projeto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Digite o nome do projeto',
              ),
            ),
            ElevatedButton(
              onPressed: saveProject,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
class ProjectDetailsScreen extends StatefulWidget {
  final Project project;

  ProjectDetailsScreen(this.project);

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  List<String> steps = [];

  @override
  void initState() {
    super.initState();
    loadSteps();
  }

  Future<void> loadSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stepsList = prefs.getStringList(widget.project.name) ?? [];
    setState(() {
      steps = stepsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
      ),
      body: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];
          return ListTile(
            title: Text(step),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddStepScreen(widget.project),
                            ),
                          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

