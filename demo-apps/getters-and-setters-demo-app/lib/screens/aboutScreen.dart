import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({super.key});

  String _name = 'Tyler Kennedy Strand';

  set setName(String title) {
    _name = title;
  }

  String get getName => _name;

  @override
  State<AboutScreen> createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ), // AppBar
      body: Column(
        children: [
          Text('Hello ${widget.getName}')
        ],
      ), // Column
    ); // Scaffold
  }
}
