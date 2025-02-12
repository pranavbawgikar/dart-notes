import 'package:flutter/material.dart';
import 'package:quizapp/controllers/counterController.dart';
import 'package:quizapp/screens/aboutScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Countercontroller countercontroller = Countercontroller();
  AboutScreen aboutScreen = AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            countercontroller.getRoll.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            aboutScreen.getName.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => AboutScreen())
              );
            }, 
            child: const Text('About')
          )
        ],
      ),
    );
  }
}
