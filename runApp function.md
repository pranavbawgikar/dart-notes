### `runApp()` function
In Flutter, the `runApp()` function acts as an entry point for your application's UI. Whenvever it is invoked, it usually takes a `Widget` which is the root of your widget hierarchy and attaches it to the screen and renders the application's UI.
It is called within the `main()` function, which is the standard entry point for dart applications.
`runApp()` is actually responsible for rendering the UI of your application on your device.
A `Widget` is nothing but a UI component. So, whichever widget we pass to `runApp()` becomes our root widget (root of the tree) and whichever widgets are present inside this root widget become the child widgets.
So, the root widget is the first widget that gets rendered followed by the child widgets.
```dart
void main() {
  runApp(const Center(
    child: Text(
      'Hello World!',
      textDirection: TextDirection.ltr // left to right
    ) // Text
  )); // Center
}
```
A `Center` object is a layout component/widget. This object is responsible for aligning all the child objects in the center of the screen.
