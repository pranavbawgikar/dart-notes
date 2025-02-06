## Type Checking
Type checking is a process of verifying that a variable or expression has the expected type. Dart is a strongly-typed language, which means that the type of a variable or expression must be known at compile-time. Dart uses a type inference system, whcich means that the type of a variable or expression is often inferred from the value assigned to it.

For example, the following code assigns the value `42` to the variable `x` and the type of `x` is inferred to be `int`:
```dart
var x = 42;
```
## Type Casting
### Downcasting in Dart
- Implicit Downcasts: A process where the language automatically converts a superclass type to a subclass type without explicit instrcution.
- Explicit Downcasts: From Dart 2.9 and later, implicit downcasting has been disallowed to enhance type safety and must now be performed explicitly using the `as` operator.

Example
```dart
Object x = 'hello';
// Implicit downcasting (no longer allowed)
String s1 = x;

// Explicit downcasting
String s2 = x as String;
```
In the above example, assigning `x` to `s1` without an explicit cast results in a compile-time error. To correct this, you must use, `as String` to explicitly downcast `x` to a `String`.
## Type Test Operators
In dart, you can check the type of variable at runtime using the `is` keyword. When you don't pass any data to a variable it is defined as 'dynamic' by default.

<a href="https://github.com/PranavBawgikar/dart-notes/blob/main/type-test-operators.dart">Example code here.</a>
