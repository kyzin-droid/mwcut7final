import 'package:flutter/material.dart';
import 'add_project_collaborator.dart';
import 'search_order.dart';
import 'package:mwcut/screens/collaborator/add_step_collaborator.dart';


class ManageOrderCollaborator extends StatelessWidget {
  ManageOrderCollaborator({super.key, required this.title});

  final String title;

  TextEditingController orderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
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
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    child: Column(
                      children: const [
                        Text(''),
                        Text(''),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectsScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Verificar Projetos',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
