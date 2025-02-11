## Futures
### Why asynchronous code matters?
Asynchronous operations let your program complete work while waiting for another operation to finish. Fetching data over a network, writing to database or reading data from a file are all asynchronous operations.
Such asynchronous computations usually provide their result as a `Future` or if the result has multiple parts, as a `Stream`. To interact with these asynhronous results, you can use the `async` and `await` keyword.
### `Future` class
A `future` is an instance of `Future` class. A `future` represents the result of an asynchronous operation and can have two states: completed and uncompleted.
#### Uncompleted
When you call an asynchrnous function, it immediately returns a `Future` object that is in an uncompleted state. This `Future` represents a promise that a result (or an error) will be available at some point in the future.
That `future` is waiting for the function's asynchronous operation to finish or to throw an error.

For example, when fetching data from a network, you might use the `http` package's `get` method, which returns a `Future` that completes with the server's response:
```dart
Future<String> fetchData() {
  // Simulate a network request by delaying for 2 seconds
  return Future.delayed(Duration(seconds: 2), () => 'Data loaded');
}

void main() {
  // Call the asynchronous function
  Future<String> future = fetchData();

  // At this point, 'future' is uncompleted
  print('Future is uncompleted: $future');

  // You can register a callback to be invoked when the future completes
  future.then((data) {
    print('Future completed with: $data');
  });

  // Output:
  // Future is uncompleted: Instance of '_Future<String>'
  // (After 2 seconds)
  // Future completed with: Data loaded
}
```
#### Completed
If the asynchronous operation succeeds, the `future` completes with a value. Otherwise, it completes with an error.
##### Completing with a value
A `future` of type `Future<T>` completes with a value of type `T`. For example, a `future` with type `Future<String>` produces a string value. If a `future` doesn't produce a usable value, then the future's type if `Future<void>`.
##### Completing with an error
If the asynchronous operation performed by the function fails for any reason, the `future` completes with an error.
