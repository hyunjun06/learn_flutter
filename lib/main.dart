import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void onClick() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click Count',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text('$count',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.w200)),
            IconButton(
              onPressed: onClick,
              icon: const Icon(Icons.add_box_sharp),
              iconSize: 50,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
