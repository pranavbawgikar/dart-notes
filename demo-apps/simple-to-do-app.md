Here's a preview of the app: <video src="https://github.com/user-attachments/assets/089ea689-cab1-404b-a034-a79c0112a0f2" />

Find the code for the app <a href="https://github.com/PranavBawgikar/dart-notes/blob/main/demo-apps/simple-to-do-app.dart">here</a>.
#### Entry Point
```dart
import 'package:flutter/material.dart';
```
Flutter Material package contains pre-built widgets and themes.
#### `ToDoApp` Widget
```diff
class ToDoApp extends StatelessWidget {
+  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple To Do App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ToDoHomePage(),
    );
  }
}
```
A `key` is used in Flutter to uniquely identify widgets in the widget tree. The constructor allows you to create an instance of `ToDoApp` and optimally pass in a `key`.
The key is then passes up to the superclass (in this case, `StatelessWidget`), which helps Flutter manage the widget tree efficiently.
The named parameter `super.key` is specifically used to forward the `key` parameter to the superclass which is usually `StatelessWidget` or `StatefulWidget`.

If you omit the `super.key` parameter in your widget's constructor, it means that instances of your widget cannot accept a `key` when they are created.
This is acceptable if your widget doesn't need to maintain it's state across rebuilds or if it doesn't require unique identification among it's siblings.
In such cases, the widget will function correctly without a `key`. However, it's considered a good practice to include the `key` parameter in the constructors of public or reusable widgets.
The Dart linter even includes a rule `use_key_in_widget_constructors` that encourages this practice.
```diff
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

+  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple To Do App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ToDoHomePage(),
    );
  }
}
```
The `@Override` annotation is used to indicate that the build method is overriding a method in it's superclass. The `StatelessWidget` defines a `build` method.
```diff
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
+  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple To Do App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ToDoHomePage(),
    );
  }
}
```
`BuildContext` parameter provides information about the location of this widget in the widget tree.
```diff
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
+    return MaterialApp(
      title: 'Simple To Do App',
+      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ToDoHomePage(),
    );
  }
}
```
The `MaterialApp` widget is a convenience widget that wraps several widgets commonly required for material design apps. It provides functionalities such as navigation, theming, and localization.
By returning `MaterialApp`, we are setting up the core structure of the Flutter app.
The `theme` property applies a global theme to the app. By providing a `ThemeData` object, we can define the visual properties of the application's components.
Within the `ThemeData` the `primarySwatch` defines a set of primary colors to use.
```diff
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple To Do App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
+      home: const ToDoHomePage(),
    );
  }
}
```
The `home` property specifies the default route of the app, which is displayed when the app starts. Here, it is set to an instance of `ToDoHomePage`.
The `const` keyword indicates that this widget is immutable and can be compiles to a compile-time constant, which can improve performance.
#### `ToDoHomePage` Widget
```diff
+ class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  _ToDoHomePageState createState() => _ToDoHomePageState();
}
```
The `ToDoHomePage` is a stateful widget because it will maintain a list of tasks that can change overtime. In Dart, you are not required to explicitly define a constructor for every class you create.
If you do not provide a constructor, Dart automatically supplies a constructor for you.
```diff
class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
+  _ToDoHomePageState createState() => _ToDoHomePageState();
}
```
`createState()` method is an in-built method with the `StatefulWidget` class. Every class that extends `StatefulWidget` must override the `createState()` method.
This method is called by the Flutter framework to create the mutable state for that wudget, which is then managed by a `State` subclass.
In other words, `createState()` is a part of Flutter's widget lifecycle and is essential for creating the `State` object that holds the widget's mutable data.
Without overriding this method, you cannot properly implement a stateful widget.
