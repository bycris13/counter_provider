import 'package:counter_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 👉 `watch` escucha los cambios del estado y reconstruye el widget cuando `notifyListeners()` es llamado.
    final counterProvider = context.watch<CounterProvider>();

    var fontsize30 = const TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text('Counter Screen')),
        elevation: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Numero de clicks',
            style: fontsize30,
          )),
          Center(
              child: Text(
            '${counterProvider.count}',
            style: const TextStyle(fontSize: 200, fontWeight: FontWeight.w100),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Los botones usan `read` de manera indirecta, porque el `counterProvider` fue obtenido arriba con `watch`.
        _CustomFloatingActionButton(
          counterProvider: counterProvider,
          onPressed: () => counterProvider.increment(),
          icon: Icons.plus_one,
        ),
        _CustomFloatingActionButton(
          counterProvider: counterProvider,
          // Uso del read directo.
          onPressed: () => context.read<CounterProvider>().decrement(),
          icon: Icons.exposure_minus_1_outlined,
        ),
        _CustomFloatingActionButton(
          counterProvider: counterProvider,
          onPressed: () => counterProvider.reset(),
          icon: Icons.refresh,
        ),
      ]),
    );
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton(
      {required this.counterProvider,
      required this.icon,
      required this.onPressed});

  final CounterProvider counterProvider;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed, shape: const CircleBorder(), child: Icon(icon));
  }
}
