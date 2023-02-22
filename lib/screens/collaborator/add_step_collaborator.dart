import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwcut/screens/collaborator/manage_order_collaborator.dart';
import 'add_project_collaborator.dart';

class AddStepCollaborator extends StatelessWidget {
  AddStepCollaborator({super.key, required this.title});

  final String title;

  TextEditingController descriptionController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Image(
                    image: AssetImage('assets/logo-mwcut.png'),
                    width: 200,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Adicionar Projeto'),
                  
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: descriptionController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Descreva a etapa',
                      icon: Icon(Icons.description),
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 60),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManageOrderCollaborator(title: 'Adicionar',),
                      ),
                    );
                  },
                  child: const Text('Adicionar etapa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

