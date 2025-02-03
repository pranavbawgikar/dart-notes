void main() {
  print('Hello Dart');
  print(2 + 2);
  
  int myVar = 1; // Local integrer variable
  double doubleVar = 1.2; // Local double variable
  String stringVar = "Starting with Dart"; // Local string variable
  // A string can be defined either with single quotes or double quotes
  bool booleanVar = true; // Local boolean variable
  
  myVar = 1000; // Changing the value of `myVar` variable
  
  num myNumber = 1.3; // Data type that stores both integer and double values
  
  var undefined = 'Hi'; // Local integer variable, since we are storing an integer value inside the variable
  // var undefined; // If we just declare the variable without intializing its value, Dart would just declare it as `Null`
  print(undefined.runtimeType);
  
  print(myVar);
  print(doubleVar);
  print(stringVar);
  print(booleanVar);
  
  List<int> array = [1, 2, 6]; // We can also replace 'List<int>' with 'var' and dart will figure it out 
  print(array); // Output: [1, 2, 6]
  print(array.runtimeType); // Output: List<int?
  
  Map<String, String> rescue = {
    'ladder': '126',
    'city': 'Austin',
  };
  
  print(rescue); // Output: {ladder: 126, city: Austin}
  print(rescue.keys);
  print(rescue.values);
  
  String interpolation = '$undefined, $stringVar'; // Example of String Interpolation in Dart
  print(interpolation);
  
  printPrice(price: 5); // Output: The price is 5
  printPrice(); // Output: Free
  
  final age = 22; // Both `const` and `final` does the same work - create  constant variable
  const agev2 = 23;
  
  final date = DateTime.now(); // Error: The constructor being called isn't a const constructor
  // We can't use `const` here because we don't know when the program will run, making the value of the variable runtime dependent
  // Hence, we make use of the `final` keyword instead of the `const`
  
  // date = DateTime.now(); // Error: Const variables can't be assigned a value
  
}

void printPrice({int? price}) {
  if (price == null) {
    print('Free');
  } else {
    print('The price is $price');
  }
}

// Dart is a strongly-typed or type-safe language, for instance, if you try to store a decimal value inside an integer variable you would encounter an error
