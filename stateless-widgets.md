## Stateless Widgets
Stateless widgets (`StatelessWidget`) are those type of widgets where the state once created cannot be changed. That is, it can run only once which is when the app is loaded.

Example:
```dart
import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World!');
      ), // Center
    ); // Scaffold
  }
}
```
So, whenever `MyStatelessWidget` is instantiated it will call the build function and draw that one widget on the screen.
