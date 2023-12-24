import 'package:flutter/material.dart';

class UiControllsScreen extends StatefulWidget {

  static const name = 'ui_controlls_screen';

  const UiControllsScreen({super.key});

  @override
  State<UiControllsScreen> createState() => _UiControllsScreenState();
}

enum Transportation { car, plane ,}

class _UiControllsScreenState extends State<UiControllsScreen> {
  bool isDriver = true;

  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui controll'),
      ),

      body: ListView(
        children: [

          SwitchListTile(
            title: const Text('is diver?'),
            subtitle: const Text('this option active and desactive the driver'),
            value: isDriver, 
            onChanged: (value) => setState(() {
              isDriver = !isDriver; //?Indica que es diferente al valor que contiene
            }),
            ),

          RadioListTile(
            title: const Text('By plane'),
            subtitle: const Text('with this option we will select a plane transportation'),
            value: Transportation.plane, //*El valor que tendrá la opcion al escogerla
            groupValue: selectedTransportation, //* el valor que vamos a utilizar para marcar la opcion seleccionada
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.plane;
            }),
            ),

          RadioListTile(
            title: const Text('By car'),
            subtitle: const Text('with this option we will select a car transportation'),
            value: Transportation.car, 
            groupValue: selectedTransportation, 
            onChanged: (value) => setState(() {
              selectedTransportation = Transportation.car;
            }),
            ),
          
        ],
      ),
    );
  }
}