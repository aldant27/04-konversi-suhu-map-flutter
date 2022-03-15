import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  

  @override
 Widget build(BuildContext context) {
    return TextField(
      controller: etInput,
      decoration: const InputDecoration(
          labelText: "Celcius", hintText: "Masukkan suhu dalam satuan celcius"),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
