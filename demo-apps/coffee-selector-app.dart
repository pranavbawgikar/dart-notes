import 'package:flutter/material.dart';

void main() {
  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Dog App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coffee House'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DogName('Iced Caramel Macchiato', 'assets/coffee_1.jpg'),
              const SizedBox(height: 24.0),
              DogName('Pumpkin Spice Latte', 'assets/coffee_2.jpg'),
              const SizedBox(height: 24.0),
              DogName('Peppermint Mocha', 'assets/coffee_3.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

class DogName extends StatelessWidget {
  final String name;
  final String imagePath;
  const DogName(this.name, this.imagePath, {super.key});

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.asset(imagePath),
          actions: [
            TextButton( //
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showImageDialog(context),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
          name,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
