import 'package:flutter/material.dart';
import 'dart:math';

class AnimatesScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatesScreen({super.key});

  @override
  State<AnimatesScreen> createState() => _AnimatesScreenState();
}

class _AnimatesScreenState extends State<AnimatesScreen> {

  double borderRadius = 12;
  double height = 100;
  double width = 100;
  Color color = Colors.indigo;
  

  void changeShape(){
    final ramdom = Random();

    width = ramdom.nextInt(200) + 25;

    height = ramdom.nextInt(200) + 25;

    borderRadius = ramdom.nextInt(20) + 12;

    color = Color.fromRGBO(ramdom.nextInt(255), ramdom.nextInt(255), ramdom.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration( milliseconds: 400), //!El tiempo que tomará en hacer la animacion
          //? curve: , propiedad para definer el tipo de animacion que hará
          height: height <= 0 ? 0 : height,
          width: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}