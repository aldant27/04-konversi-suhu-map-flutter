import 'package:flutter/material.dart';
import 'package:dropdown_map/widgets/konversi.dart';
import 'package:dropdown_map/widgets/input.dart';
import 'package:dropdown_map/widgets/history.dart';
import 'package:dropdown_map/widgets/result.dart';
import 'package:dropdown_map/widgets/dropdown.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropDown = 'Kelvin';
  int hasilPerhitungan = 0;
  List<String> listHasil = <String>[];

  var result;

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273;
            break;
          case 'Reamur':
            hasilPerhitungan = (4 * int.parse(etInput.text) / 5) as int;
            break;
          case 'Fahrenheit':
            hasilPerhitungan = (9 * int.parse(etInput.text) / 5) as int;
            break;
          default:
        }
        listHasil.add(selectedDropDown + " : " + hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'konversi suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Input(etInput: etInput),
              Dropdown(selectedDropDown: selectedDropDown, listSatuanSuhu: listSatuanSuhu, onDropDownChanged: onDropDownChanged, konversiSuhu: konversiSuhu),
              konversi (hasilPerhitungan: hasilPerhitungan,),
              Results(result : result,),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Riwayat Konversi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              History(listHasil: listHasil)
            ],
          ),
        ),
      ),
    );
  }
}


