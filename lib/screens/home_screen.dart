import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(Object context) {
    var fontsize30 = const TextStyle(fontSize: 30);
    int counterClick = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text('HomeScreen')),
        elevation: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Numeor de clicks',
            style: fontsize30,
          )),
          Center(
              child: Text(
            '$counterClick',
            style: const TextStyle(fontSize: 200, fontWeight: FontWeight.w100),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterClick++;
          print('counter $counterClick');
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
