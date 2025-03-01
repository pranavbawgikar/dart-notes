## Object Oriented Programming & Constructors
### Inheritance
Inheritance is the mechanism by which one class (child or subclass) can reuse, extend or modify the behavior of another class (parent or superclass). This is crucial in Flutter when you want to build upon existing widgets or create custom widget hierarchies.
#### Single Inheritance
Dart supports only single inheritance (a class can extend only one other class). However, you can mix in additional behavior using mixins.

Example:
```dart
class Animal {
  void eat() {
    print('eating food');
  }
}

class Dog extends Animal {
  void bark() {
    print('barking');
  }
}

void main() {
  Dog dog = Dog();
  dog.eat();
  dog.bark();
}
```
#### Calling the Superclass Constructor
In the subclass constructor, you can call the parent’s constructor using the `super` keyword. This is necessary when the superclass does not have a default constructor.

Example:
```dart
class Employee {
  String name;
  double salary;
  
  Employee(this.name, this.salary);
}

class Manager extends Employee {
  int teamSize;
  
  // Calling super class constructor using `super`
  Manager(String name, double salary, this.teamSize) : super(name, salary);
}
```
#### Method Overriding & the @override Annotation
Subclasses can override methods defined in the superclass to change or extend behavior. Using the @override annotation is considered best practice as it makes your intent explicit.

Example:
```dart
class Animal {
  void makeSound() {
    print('animal makes a sound.');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('meow');
  }
}

void main() {
  Cat cat = Cat();
  cat.makeSound();
}
```
#### Abstract Class
Abstraction refers to hiding the implementation details from the end user. In Dart, an abstract class can contain both abstract methods (methods without implementation) and concrete methods (methods with implementation). You cannot create an instance of the abstract class. Abstract methods are declared without a body, serving as a contract that any subclass ust fulfil by providing its own implementation.

There are no explicit interfaces in Dart, instead we have implicit interfaces. Every class in Dart defines an implicit interface.

To declare an abstract class, use the `abstract` keyword:
```dart
abstract class Animal {
  void makeSound();
}
```
Any class that extends `Animal` must provide an implementation for `makeSound()`.

Dart offers two primary ways to utilize abstract classes:
##### Extending abstract classes
A subclass can inherit from an abstract class using the `extends` keyword. This allows the subclass to inherit the abstract class' methods (which must be implemented) and any concrete methods or properties.
```dart
class Dog extends Animal {
  @override
  void makeSound() {
    print('bark');
  }
}

void main() {
  Dog dog = Dog();
  dog.makeSound();
}
```
##### Implementing abstract classes
A class can implement an abstract class using the `implements` keyword. This requires the class to provide concrete implementations for all methods defined in the abstract class, but it doesn’t inherit any method implementations from the abstract class.
```dart
void main() {
  Cat cat = Cat();
  cat.makeSound();
}

class Cat implements Animal {
  void makeSound() {
    print('meow');
  }
}
```
Another Example:
```dart
abstract class Shape {
  double area();
}

class Rectangle implements Shape {
  final double width;
  final double height;
  
  Rectangle(this.width, this.height);
  
  double area() => width * height;
}

class Circle implements Shape {
  final double radius;
  
  Circle(this.radius);
  
  double area() => 3.14 * radius * radius;
}

void main() {
  Shape rectangle = Rectangle(12, 24);
  Shape circle = Circle(34);
  
  print('The area of rectangle is ${rectangle.area()}');
  print('The area of circle is ${circle.area()}');
}
```

### Encapsulation
Dart uses a simple convention to indicate privacy. Prefixing a member's name with an underscore (_) makes it private to the library. This helps in hiding internal implementation details.

Example:
```dart
class BankAccount {
  double _balance; // Private

  BankAccount(this._balance);

  // Public getter
  double get balance => _balance;

  // Public method to modify balance safely
  void deposit(double amount) {
    if(amount > 0) {
      _balance = amount;
    }
  }
}
```

Constructors are special functions that create instances of classes. In Flutter, every widget has a constructor that defines it's configurations. Different types of constructors in Dart:
1. Generative Constructors
2. Default Constructors
3. Named Constructors
4. Constant Constructors
5. Factory Constructors
6. Redirecting Constructors
### Generative Constructors
These constructors create new instances and intialize instance variables.
```dart
class Point {
  // Instance variables to hold the coordinates of the point
  double x;
  double y;

  // Generative constructor with initializing formal parameters
  Point(this.x, this.y);
}
```
### Default Constructors
The default constructor is a generative constructor that does not have any arguments, it simply creates a new instance of the class.
```dart
class MyClass {
  // No constructor defined
  int value = 0;
}

void main() {
  var instance = MyClass();
  print(instance.value); // Output: 0
}
```
In the above example, `MyClass` does not have an explicitly defined constructor. When we create an instance using `MyClass()`. Dart uses the default constructor to instantiate the object.
However, if your class needs to initialize properties with specific values or requires particular setup during instantiation, you need to define a constructor to handle that initialization.
### Named (Parameterized) Constructor
Named constructor is implemented when multiple constructors for a class are required.

Example 1:
```dart
class MyClass {
  int value;
  MyClass(this.value);
}

void main() {
  var instance = MyClass(42);
  print(instance.value); // Output: 42
}
```

Example 2:
```dart
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  // Default constructor
  Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = xOrigin, y = yOrigin;
}

void main() {
  // Using the default constructor
  Point p1 = Point(3, 4);
  print('Point p1: (${p1.x}, ${p1.y})'); // Output: Point p1: (3.0, 4.0)

  // Using the named constructor
  Point p2 = Point.origin();
  print('Point p2: (${p2.x}, ${p2.y})'); // Output: Point p2: (0.0, 0.0)
}
```
The above code defines a `Point` class with twi constructors: a default constructor and a named constructor. `xOrigin` and `yOrigin` are global constants set to `0`. They represent the origin point in a 2D space. Inside the `Point` class, `x` and `y` are `final` instance variables. `Point(this.x, this.y)` is a generative constructor that initializes a `Point` object with specified `x` and `y` values.

`Point.origin() : x = xOrigin, y = yOrigin` is a named constructor with name 'origin'. It initializes a `Point` object with `x` and `y` set to `xOrigin` and `yOrigin`, respectively.

Example 3:
```dart
class Rectangle {
  double width;
  double height;

  Rectangle({required this.width, required this.height});

  double area() => width * height;
}

void main() {
  var rect = Rectangle(width: 5, height: 10);
  print('Area: ${rect.area()}'); // Output: Area: 50
}
```
The `required` keyword is used in named parameters to indicate that a parameter must be provided when calling a function or constructor.

### Factory Constructors
These aren't required to return new instances every time, they can return cached instances or even objects of subtypes. They are useful for implementing patterns like singleton.

Example:
```dart
class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);

  void log(String message) {
    print('$[name] $message');
  }
}
```
