void main() {
  var undefined = 'Hi';
  
  print(undefined is int); // Output: false, checking the type of the variable at runtime
  print(undefined is! int); // Output: true
}
