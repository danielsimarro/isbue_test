import 'package:flutter/material.dart';

class MyCustomTable extends StatelessWidget {
  final List<List<String>> listTable;

  const MyCustomTable({super.key, required this.listTable});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border:
              TableBorder.all(color: const Color.fromARGB(255, 214, 214, 214)),
          children: [
            TableRow(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(73, 37, 185, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              children: List.generate(
                  4,
                  (index) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Título $index',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
            ),
            ...listTable.map((row) => TableRow(
                  children: row
                      .map((cell) => Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(cell,
                                style: const TextStyle(color: Colors.black)),
                          ))
                      .toList(),
                )),
          ],
        ),
      ),
    );
  }
}
