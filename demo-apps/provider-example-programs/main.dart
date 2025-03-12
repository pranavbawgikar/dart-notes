import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/counter_providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                Provider.of<CounterProvider>(context).countValue.toString(),
              ),
              ElevatedButton(
                onPressed: () => Provider.of<CounterProvider>(context, listen: false).incrementNumber(),
                child: const Text('+'),
              ),
              ElevatedButton(
                  onPressed: () => Provider.of<CounterProvider>(context, listen: false).decrementNumber(),
                child: Text('-')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
