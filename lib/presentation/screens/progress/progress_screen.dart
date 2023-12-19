import 'package:flutter/material.dart';

class ProgressScren extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgressIndicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.black38,
            strokeWidth: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Circular progress indicator controlado'),
          SizedBox(
            height: 10,
          ),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: 
        Stream.periodic( const Duration(milliseconds: 100), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final double progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black38,
                  strokeWidth: 3,
                ),
                const SizedBox( width: 20,),
                Expanded(child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black38,
                  minHeight: 3,
                ))
              ],
            ),
          );
        }
      ),
    );
  }
}