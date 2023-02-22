import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Pedido 1',
  'Pedido 2',
  'Pedido 3',
  'Pedido 4',
  'Pedido 5',
  'Pedido 6',
  'Pedido 7',
  'Pedido 8',
  'Pedido 9',
  'Pedido 10',
];

class SearchOrderClient extends StatelessWidget {
  const SearchOrderClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SearchOrderButton(),
    );
  }
}

class SearchOrderButton extends StatefulWidget {
  const SearchOrderButton({super.key});

  @override
  State<SearchOrderButton> createState() => _SearchOrderState();
}

class _SearchOrderState extends State<SearchOrderButton> {
  String searchOrderValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        color: Colors.grey[200],
        width: 300,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: DropdownButton(
            value: searchOrderValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 2,
            style: const TextStyle(color: Colors.black),
            underline: Container(height: 0),
            onChanged: (String? value) {
              setState(
                () {
                  searchOrderValue = value!;
                },
              );
            },
            items: list.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
