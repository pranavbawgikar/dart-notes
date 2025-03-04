## Assignment 1 - Dart I/O and Strings
```dart
import 'dart:io';
```
The program imports the `dart:io` library to enable input/output operations. This allows the program to read user input from the console and print output.

The constructor of the abstract class `Item` initializes the properties of the class.

`calculateFinalPrice()` computes the final price by adding the base price to the computed sales tax.

```dart
RawItem(String name, double price, int quantity) : super(name, price, quantity, 'raw');
```
The first part declares a constructor for the `RawItem` class. It takes three parameters: `name`, `price`, and `quantity`. The latter part is known as a constructor initializer list.
It is used to perform initialization before the constructor’s body runs.

`super(...)` calls the constructor of the superclass (in this case, the abstract class `Item`), and passes the value to its superclass before it runs its own constructor.
- The tax rule for raw items is 12.5% of the base price so we multiply 0.125 * price.
- The tax rule for manufactured items is a basic tax of 12.5% of the price and an additional 2% on the sum of the price and the basic tax.
- Finally, the tax rule for imported items is a 10% import duty on the price. `importDuty` is calculated as 0.10 * base price. Then, the total cost for an imported item is computed.
    - If the item is upto $100 then a flat surcharge of $5.
    - If between $101 and $200, a flat surcharge of $10.
    - And, if above $200, a surcharge of 5% of the total cost.

The total sales tax is the sum of the import duty and the applicable surcharge.

The `main` function serves as the entry point of the program and continuously prompts the user for item details. The program starts by parsing the initial command-line arguments provided when the program is run.
If `parseArguments` returns a valid `Item` instance, the `display()` method is called to print items details.
If parsing fails, an error message is printed, and the user is prompted to re-enter deatils.

`stdout.write` is used to print a message to the console. 
```dart
String? input = stdin.readLineSync();
```
This line waits for the user to type something and press enter. It reads the entire the as a String. The result is stored in the variable `input`, which can be `null` if no input is provided.
The `if` condition checks if the input is `null`. If it is, the loop is exited using `break`. This serves as an exit condition.
```dart
args = input.split(' ');
```
The input.split(' ') method splits the input string into a list of substrings wherever there is a space character. This converts the user's single line of text into a list of arguments (args), similar to how command-line arguments are provided to a program.
```dart
Item? parseArguments(List<String> args) {
  String? name;
  double? price;
  int? quantity;
  String? type;
```
The function is declared to return an Item? (an Item or null in case of an error). Four nullable variables (name, price, quantity, and type) are declared. 
They will hold the values parsed from the command-line arguments.
```dart
      case '-name':
        if (i + 1 < args.length) {
          name = args[++i];
        } else {
          print('Error: -name option requires a value.');
          return null;
        }
        break;
```
Checks if there is another element after `-name`. If so, it assigns that next element to `name` (using the pre-increment `++i` to move to the next index).
If not, it prints an error message and returns `null`.
```dart
      case '-price':
        if (i + 1 < args.length) {
          price = double.tryParse(args[++i]);
          if (price == null) {
            print('Error: Invalid value for -price.');
            return null;
          }
        } else {
          print('Error: -price option requires a value.');
          return null;
        }
        break;
```
The above case checks for the existence of a following value and uses `double.tryParse` to convert the next argument into a double.
If conversion fails (i.e., the value isn’t a valid double), it prints an error and returns `null`.
```dart
      case '-type':
        if (i + 1 < args.length) {
          type = args[++i].toLowerCase();
          if (type != 'raw' && type != 'manufactured' && type != 'imported') {
            print('Error: Invalid value for -type.');
            return null;
          }
        } else {
          print('Error: -type option requires a value.');
          return null;
        }
        break;
```
It ensures a value follows the `-type` option and converts the value to lowercase (to allow case-insensitive matching). It also validates that the type is one of the three allowed values: `'raw'`, `'manufactured'`, or `'imported'`.
If the type is invalid or missing, an error is printed and `null` is returned.
