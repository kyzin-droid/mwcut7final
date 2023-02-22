import 'package:flutter/material.dart';
import 'manage_order_collaborator.dart';



class LoginCollaborator extends StatefulWidget {
  const LoginCollaborator({super.key, required this.title});

  final String title;

  @override
  State<LoginCollaborator> createState() => _LoginCollaborator();
}

class _LoginCollaborator extends State<LoginCollaborator> {
   final _formKey = GlobalKey<FormState>();
   final _requiredWord = 'mwcutcolab@gmail.com';
   dynamic _userInput;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/logo-mwcut.png'),
                      width: 200,
                    ),
                  ],
                  
                ),
              ),
              Text(
                'Login'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text('Colaborador'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 50),
                child: Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'seu@email.com',
                          icon: Icon(Icons.mail),
                          filled: true,
                        ),
                      validator: (value) {
                          if (value != _requiredWord){
                            return 'Email Incorreto, tente novamente';                           
                          }
                          return null;                          
                      },
                      onChanged: (value){

                         _userInput = value; 

                      },
                      ),
                    ),
                    
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160, 60),
                    ),
                    onPressed: ()   { 

                      if (_formKey.currentState != null && _formKey.currentState!.validate()){                                
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageOrderCollaborator(
                              title: 'Gerenciar pedido'),
                        ),
                      );
                      }
                    },
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
