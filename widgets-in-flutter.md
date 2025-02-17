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
