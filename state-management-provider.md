## State Management in Flutter
In Flutter, managing the state of your application efficiently is crucial for building responsive and maintainable apps. State, in the context of a Flutter application, represents the information that can change overtime and influences the appearance and behavior of the UI. 
- Stateful widgets are Flutter's built-in mechanism for hanfling state. They consists of two classes: `StatefulWidget` and `State`. The `StatefulWidget` holds the immutable part of the widget, while the `State` object represents the mutable state data. When the state data changes, calling `setState()` triggers a rebuild of the widget, updating the UI. Classes that extend `StatefulWidget` can maintain mutable state.
- If you want to update the state of your widget within a `StatelessWidget`, the provider package can be used.
### Provider Package
At it's core, this package facilitates the sharing of data across your application, allowing widgets to listen to and react to changes in the application state.
### Key components of Provider
#### changeNotifier
It is a class that extends `ChangeNotifier` and provides a way to manage state. It includes the `notifyListeners()` method, which notifes all the listeners about the changes and prompts them to rebuild.
#### ChangeNotifierProvider
This widget creates an instance of a `ChangeNotifier` to it's descendants. It's placed above the widget that need access to the state.
#### ValueNotifier
`ValueNotifier` only rebuilds the widget passes inside the `ValueListenableBuilder` unlike, `setState()` which rebuilds the entire widget tree.
#### Consumer
A widget that listens to changes in the `ChangeNotifier` and rebuilds whenever the notifier calls `notifyListeners()`.
#### Provider Methods
In Flutter's provider package, `context.watch<T>()` and `context.read<T>()` are commonly used to access providers within the widget tree. `context.watch<T>()` listens to changes in the provider and rebuilds the widget when the provider's state changes, while `context.read<T>()` accesses the provider without setting up a listener, meaning the widget won't rebuild on provider updates.

There is also an alternative to using the `watch` and `read` methods, refer to this <a href="https://github.com/pranavbawgikar/dart-notes/blob/main/demo-apps/movie-favorite-app/lib/main.dart">program </a>:

To listen to changes and rebuild the widget
```dart
var fav = Provider.of<MovieProvider>(context).favList;
```
To access the provider without listening
```dart
var fav = Provider.of<MovieProvider>(context, listen: false).favList;
```
Another example for State Management for Provider <a href="https://github.com/pranavbawgikar/dart-notes/tree/main/demo-apps/provider-example-programs">here</a>.
