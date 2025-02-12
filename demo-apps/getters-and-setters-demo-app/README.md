## Getters and Setters
Getters and setters are special methods that provide read and write access to an object's properties.
### Getters
These methods allow you to access a property.
Example 1:
```dart
class Circle {
  double radius;
  
  Circle(this.radius);
  
  double get area => 3.14 * radius * radius;
}
```
The `=>` syntax in Dart is known as the arrow syntax and is a shorthand for functions that contain a single expression. It's functionally equivalent to using curly braces and the return statement but offers a more concise way to write simple functions.
```diff
// Using arrow syntax
double get area => width * height;

// Equivalent using curly braces
double get area {
  return width * height;
}
```
Both implementations achieve the same result, but the arrow syntax provides a more succinct representation.

Example 2:
```dart
class Temperature {
  double _celsius;

  Temperature(this._celsius);

  // Getter for Fahrenheit
  double get fahrenheit => _celsius * 9 / 5 + 32;

  // Setter for Fahrenheit
  set fahrenheit(double value) {
    _celsius = (value - 32) * 5 / 9;
  }
}

void main() {
  var temp = Temperature(25);
  print('Celsius: ${temp._celsius}'); // Output: Celsius: 25.0
  print('Fahrenheit: ${temp.fahrenheit}'); // Output: Fahrenheit: 77.0

  temp.fahrenheit = 86;
  print('Celsius: ${temp._celsius}'); // Output: Celsius: 30.0
}
```
The class `Temperature` is defined with a private instance variable `_celsius`. In Dart, a leading underscore makes a variable or method private to its library.
The `this` keyword refers to the current instance of the class. When you write `this._celsius`, it distinguishes the instance variable from any similarly named parameter.
```diff
Temperature(this._celsius);
```
The above piece of code is a shorthand constructor parameter that automatically assigns the value passed to the constructor to the instance variable `_celsius`.
It is a shorthand way to write the following code:
```diff
Temperature(double celsius) {
  this._celsius = celsius;
}
```
### Setters
These methods allow you to set a property for a value.
Example:
```dart
class Square {
  double _side;
  
  Square(this._side);
  
  set side(double value) {
    if(value > 0) {
      _side = value;
    }
  }
  
  double get area => _side * _side;
}
```

Check this <a href="https://github.com/PranavBawgikar/dart-notes/tree/main/demo-apps/getters-and-setters-demo-app/lib">example</a> app to demonstrate the use of getters and setters in Dart.

Explanation of the above example app:
