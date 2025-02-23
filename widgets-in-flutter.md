## Widgets
### Scaffold
Scaffold in Flutter provides a default structure for the app. It provides standard components like the app bar, drawer, floating action button, and bottom navigation bar.
```dart
Scaffold(
  appBar: AppBar(
    title: Text('Home'),
  ),
  body: Center(
    child: Text('Welcome to the Home Page'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
);
```
### InkWell
In Flutter, the `InkWell` widget provides a visual response when a user interacts with a part of the application. It adds a 'ripple' effect to it's child widget upon touch. It can detect various gestures like taps, double taps, long presses, etc. In essence, `InkWell` is used whenever you want to make a non-interactive widget respond to touch or a visual effect.

Making images respond to taps by wrapping them with `InkWell`.
```dart
InkWell(
  onTap: () {
    // Handle image tap
  },
  child: Image.network('https://example.com/image.jpg'),
)
```

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('InkWell Example')),
        body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('InkWell tapped!')),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Tap Me',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```
The `InkWell` widget must have a `material` widget as an ancestor. In the above code, the `Scaffold` provides the necessary `Material` context.
#### Possible error scenarios
##### No ScaffoldMessenger widget found
This error occurs when the `ScaffoldMessenger.of(context)` method cannot locate a `ScaffoldMessenger` ancestor in the widget tree. This typically happens when the `context` used to call `ScaffoldMessenger.of(context)` is not under a `MaterialApp` or `Scaffold` widget, which are responsible for providing the `ScaffoldMessenger` context. The `onTap` callback of the `InkWell` widget attempts to show a `SnackBar` using `ScaffoldMessenger.of(context)`. However, if the `context` at this point does not have a `ScaffoldMessenger` ancestor usually introduced by the `MaterialApp`, Flutter would throw this exception.

To resolve this issue, we can ensure that the `context` used to call `ScaffoldMessenger.of(context)` is a descendant of a `ScaffoldMessenger` widget. One common approach is to wrap the widget that contains the `InkWell` in a `Builder` widget. The `Builder` widget provides a new context that is a descendant of the `Scaffold` which allows `ScaffoldMessenger.of(context)` to find the appropriate ancestor.
### Builder
If you need to access an ancestor widget that is not available in the current context, wrapping the desired widget with a `Builder` provides a new context that is a descendant of the desired ancestor. While every widget has a `build` method that provides it's `BuildContext`, there are scenarios where the immediate `BuildContext` does not have access to certain ancestors in the widget tree. This is where the `Builder` widget becomes useful.

`BuildContext` knows where a widget is located in the widget tree which is essential for tasks like theme retrieval or navigation. It enables a widget to access information from it's ancestor widgets. For example, using `Theme.of(context)` retrieves the nearest `Theme` ancestor, allowing the widget to adapt to the application's theme.

Each widget has it's own `BuildContext`, which ensures that when methods like `Scaffold.of(context)` are called, they return the `Scaffold` related to that specific context.
