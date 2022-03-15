import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Function result;

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              result();
            },
            child: const Text(
              'Konversi Suhu',
              style: TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}
