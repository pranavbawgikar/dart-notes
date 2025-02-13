## `static` Keyword in Dart
`static` indicates that a member belongs to the class itself reather than to the instances of the class. Static members can be accessed without creating an instance of the class.
Let's understand wth an example
```dart
class MathUtils {
  double pi = 3.14;

  double calculateArea(double radius) {
    return pi * radius * radius;
  }
}

void main() {
  MathUtils mathUtils = MathUtils();
  print(mathUtils.calculateArea(2)); // 12.56
}
```
In the above program, we are creating an instance of the `MathUtils` class and calling the `calculateArea()` function in the `main()` method. This is called the Instance-level access.
Here, `pi` and `calculateArea` are tied to the instance of `MathUtils`. An object of the class must be created to use these members. Every time a new `MathUtils` object is created, a new copy of `pi` is allocated. 
In scenarios where only one value of `pi` (or a single calculation method) is required, having multiple copies will be redundant and could lead to higher memory usage.

Now, let's see how `static` keyword can help in this scenario:
```diff
 class MathUtils {
+  static double pi = 3.14;

+  static double calculateArea(double radius) {
    return pi * radius * radius;
  }
}

void main() {
+ // MathUtils mathUtils = MathUtils();
  print(MathUtils.calculateArea(2));
}
```
Now, with the `static` keyword attached, `pi` and `calculateArea` belong to the class itself and not to any instance. You can call them directly using `MathUtils.calculateArea(2)` without creating an object.

### What happens when we try to access static members of a class using the instance of the class?
```diff
class MathUtils {
  static double pi = 3.14;

  static double calculateArea(double radius) {
    return pi * radius * radius;
  }
}

void main() {
+  MathUtils mathUtils = MathUtils();
+  print(mathUtils.calculateArea(2));
}
```
Output:
```
main.dart:11:19: Error: The method 'calculateArea' isn't defined for the class 'MathUtils'.
```
The error indicates that the `calculateArea` method is not recognized within the `MathUtils` class. This typically occurs when attempting to access a static method through an instance of the class, which is not the recommended practice in Dart.
In Dart, static methods belong to the class itself rather than to any instance. While some languages might allow accessing static members via an instance, Dart enforces accessing them directly through the class name. 
Attempting to call a static method on an instance can lead to errors or unexpected behavior.

Static methods are typically used in utility or helper classes where you don't need to maintain any state between calls. This avoids unnecessary instantiation of objects.
