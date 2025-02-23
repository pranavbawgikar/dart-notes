## State Management in Flutter
In Flutter, managing the state of your application efficiently is crucial for building responsive and maintainable apps.
### `provider` Package
At it's core, this package facilitates the sharing of data across your application, allowing widgets to listen to and react to changes in the application state.
### Key components of Provider
#### `changeNotifier`
It is a class that extends `ChangeNotifier` and provides a way to manage state. It includes the `notifyListeners()` method, which notifes all the listeners about the changes and prompts them to rebuild.
#### ChangeNotifierProvider
This widget creates an instance of a `ChangeNotifier` to it's descendants. It's placed above the widget that need access to the state.
#### Consumer
A widget that listens to changes in the `ChangeNotifier` and rebuilds whenever the notifier calls `notifyListeners()`.
