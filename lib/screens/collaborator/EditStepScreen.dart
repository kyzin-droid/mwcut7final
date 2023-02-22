import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_project_collaborator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddStepScreen extends StatefulWidget {
  final Project project;

  AddStepScreen(this.project);

  @override
  _AddStepScreenState createState() => _AddStepScreenState();
}

class _AddStepScreenState extends State<AddStepScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  void saveStep() async {
    final description = _descriptionController.text;
    final dateTime = _dateTimeController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stepsList = prefs.getStringList(widget.project.name) ?? [];
    stepsList.add('$description - $dateTime');
    prefs.setStringList(widget.project.name, stepsList);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar etapa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Descrição',
              ),
            ),
            TextFormField(
              controller: _dateTimeController,
              decoration: InputDecoration(
                hintText: 'Data e hora',
              ),
            ),
            ElevatedButton(
              onPressed: saveStep,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

