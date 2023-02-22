import 'package:flutter/material.dart';
import 'search_order_client.dart';

class ProductionClient extends StatelessWidget {
  ProductionClient({super.key, required this.title});

  final String title;

  TextEditingController orderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image(
                  image: AssetImage('assets/logo-mwcut.png'),
                  width: 200,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  'Selecione o pedido a ser acompanhado',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SearchOrderClient(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Molde de Injeção',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: Column(
                    children: const [
                      Text('18/03'),
                      Text('08:00'),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue[100],
                  width: 200,
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Projeção do produto iniciada'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                child: Column(
                  children: const [
                    Text('19/03'),
                    Text('08:00'),
                  ],
                ),
              ),
              Container(
                color: Colors.blue[100],
                width: 200,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Projeção finalizada e aprovada'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: Column(
                    children: const [
                      Text('19/03'),
                      Text('10:00'),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue[100],
                  width: 200,
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Início da criação do molde'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                child: Column(
                  children: const [
                    Text('22/03'),
                    Text('11:00'),
                  ],
                ),
              ),
              Container(
                color: Colors.blue[100],
                width: 200,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Produto postado na logística'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
