## Stateful Widgets
These widgets can change their state over time in response to user interactions or other factors. Use them when the UI needs to update dynamically. Examples include Checkbox, Slider and TextField.
```dart
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget() {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ), // Center
    ); // Scaffold
  }
}
```
## Flutter Widget Lifecycle
```diff
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget() {
  MyStatefulWidget({super.key});

  @override
+  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ), // Center
    ); // Scaffold
  }
}
```
### `createState()`
For Stateful widgets, the `createState()` method is called first which creates the state of the app and also returns an instance of the associated state (in this case, `_MyStatefulWidgetState()`)
```diff
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget() {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
+  @override
+` void initState() {
+    // TODO: Implemnent initState
+    super.initState();
+  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ), // Center
    ); // Scaffold
  }
}
```
### `initState()`
The `initState()` method runs once after the constructor of the app and `createState()` is called. In other words, it is invoked once the State object is inserted into the widget tree. It's used for one-time initialization, such as setting up listeners or initializing data. Let's look at an example
```diff
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget() {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
+  late int abc;

+  @override
+  void initState() {
+    super.initState();
+    abc = 10;
+  }

  @override
  Widget build(BuildContext context) {
+    return Scaffold(
      body: Center(
+        child: Text(abc.toString()),
      ), // Center
    ); // Scaffold
  }
}
```
In the above example, instead of instantiating the variable `abc` normally we mark it as `late` and initialize the value `10` to `abc` inside the `initState()` method. We call the `toString()` method since `Text()` excepts a string format and we are not returning it as a `const` as the value can change.
The general internal working of the `initState()` function is simple. The `@override` annotation tells Flutter that we are writing our own `initState()` function and not using the function that is present in the `State` abstract class which the `_MyStatefulWidget` class is extending.
The `super` keyword makes a reference to the parent object in `State` class and then calls the `initState()` function there as well.
```diff
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget() {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  late int abc;

  @override
  void initState() {
    super.initState();
    abc = 10;
  }

+  @override
+  void didChangeDependencies() {
+    super.didChangeDependencies();
+  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(abc.toString()),
      ), // Center
    ); // Scaffold
  }
}
```
### `didChangeDependencies()`
`didChangeDependencies()` function is called immediately after the `initState()` function and it also called everytime after the piece of data the widget depends on gets updated.
This function is used very rarely.
```diff
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget() {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  late int abc;

  @override
  void initState() {
    super.initState();
    abc = 10;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

+  @override
+  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
+    super.didUpdateWidget(oldWidget)
+  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(abc.toString()),
      ), // Center
    ); // Scaffold
  }
}
```
### `didUpdateWidget()`
This function is called whenever the widget attached to the `State` is replaced by another widget. It is called when the widget is rebuilt, for example, when its parent widget changes. It provides the old widget as a parameter, allowing for comparison and updates.
This function is also used very rarely.
### `dispose()`
`dispose()` function is called when the State object is permanently removed from the widget tree. It is used to clean up resources such as closing streams or disposing of controllers.
