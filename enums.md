## Enums in Dart
In Dart,  an `enum` (short for enumeration) is a special type that represents a fixed number of constant values. Enums are particularly useful for defining a set of related constant that can be be used to represent states or choices in your code.
Enums are one of the most efficient ways to represent a fixed set of values. Say we're building a to-do list application. We might use a traditional `enum` to represent task priorities.
```dart
enum Priority { low, medium, high }
```
Each constant within the `enum` (low, medium, high) is implicitly assigned an index starting from zero so they can be iterated through like a list/iterable.
Example:
```dart
enum State {
  california,
  colorado,
  texas
}
```
Enums are often used in conjunction with `switch` statements to execute different code based on the `enum` value.
```dart
void describeState(State state) {
  switch(state) {
    case State.california:
      print('The Golden State');
      break;
    case State.colorado:
      print('The Centennial State');
      break;
    case State.texas:
      print('The Lone Star State');
      break;
  }
}

void main() {
  describeState(State.california); // Output: The Golden State
}
```
### Enhanced Enums
Starting from Dart 2.17, enums can have additional features like fields, methods, and even implement interfaces. These are known as enhanced enums.
Enhanced enums allow you to attach additional information, methods and properties to each `enum` option. This means that each value in the `enum` can have some data associated with it.
Unlike normal enums, enhanced enums have custom constructors and you can pass any value to it as long as its `final`. It has to be `final` because enums don't change.
Example 1:
```dart
enum State {
  california(population: '39mil', region: 'west'),
  colorado(population: '5.8mil', region: 'southwest'),
  texas(population: '30.5mil', region: 'south');
    
  const State({required this.population, required this.region});
  
  final String population;
  final String region;

  void describe() {
    print('This state has a population of $population and lies in the $region region.');
  }
}

void main() {
  State.california.describe(); // This state has a population of 39mil and lies in the west region.
  State.colorado.describe(); // This state has a population of 5.8mil and lies in the southwest region.
  State.texas.describe(); // This state has a population of 30.5mil and lies in the south region.
}
```
In above example, the `State` enum has properties `population` and `region`, a constant constructor, and a method describe to print details about the vehicle.

Example 2:
```dart
enum GameControlEvent {
  SELECT,
  LEFT_SHOULDER,
  RIGHT_SHOULDER,
  UP,
  DOWN,
  LEFT,
  RIGHT,
  B,
  X
}

enum GameHatGPIO {
  SELECT_BUTTON(7, GameControlEvent.SELECT),
  TL_BUTTON(12, GameControlEvent.LEFT_SHOULDER),
  TR_BUTTON(16, GameControlEvent.RIGHT_SHOULDER),
  DPAD_UP_BUTTON(29, GameControlEvent.UP),
  DPAD_DOWN_BUTTON(31, GameControlEvent.DOWN),
  DPAD_LEFT_BUTTON(33, GameControlEvent.LEFT),
  DPAD_RIGHT_BUTTON(35, GameControlEvent.RIGHT),
  B_BUTTON(32, GameControlEvent.B),
  X_BUTTON(36, GameControlEvent.X);

  final int pin;
  final GameControlEvent event;

  const GameHatGPIO(this.pin, this.event);
}

void main() {
  GameHatGPIO gameHatGPIO = GameHatGPIO.DPAD_DOWN_BUTTON;
  GameHatGPIO button = GameHatGPIO.B_BUTTON;
  print('Pin number: ${button.pin}'); // Pin number: 32
  print(gameHatGPIO.event); // GameControlEvent.DOWN
}
```
In above example, `button.pin` retrieves the `pin` number associated with the `B_BUTTON`, and `gameHatGPIO.event` accesses the `event` property of the `GameHatGPIO` instance, which holds the corresponding `GameControlEvent` value.
