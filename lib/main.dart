import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 57.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const NetWorthCalculator(),
    );
  }
}

class NetWorthCalculator extends StatefulWidget {
  const NetWorthCalculator({super.key});

  @override
  State<NetWorthCalculator> createState() => _NetWorthCalculatorState();
}

class _NetWorthCalculatorState extends State<NetWorthCalculator> {
  double _networth = 0.0;

  final TextEditingController _asssets = TextEditingController();
  final TextEditingController _liabilits = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Net worth  calculator '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _asssets,
            decoration: const InputDecoration(
              labelText: 'Assets',
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _liabilits,
            decoration: const InputDecoration(labelText: 'Liabilities'),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: calculateNetWorth,
            child: const Text(
              'Calculate Net Worth ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Net Worth: ${_networth.toStringAsFixed(2)} RS.',
            style: const TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }

  void calculateNetWorth() {
    double a = double.parse(_asssets.text);
    double l = double.parse(_liabilits.text);
    _networth = a - l;
    setState(() {});
  }
}
