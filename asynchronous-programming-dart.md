## Asynchronous Programming
### Why asynchronous code matters?
#### Synchronous Operations
- Synchronous Operations ensure sequential execution, i.e., tasks are supposed to be performed one after another and each operation must complete before the next one begins.
- It demonstrates a blocking behavior that is if a task is time-consuming (e.g., reading a large file or fetching data from a remote server), it blocks execution of subsequent tasks until it finishes.

_Example_: Imagine a script that reads data from a file and then processes it. In a synchronous approach, the script will wait (block) until the entire file is read before moving on to processing, even if the file is large and takes time to load.

#### Asynchronous Operations 
- Asynchronous operations enable concurrent execution which lets your program complete work while waiting for another operation to finish.
- Time-consuming operations initiate and then allow the program to continue executing other tasks. Once the operation completes, it signals the program (often through callbacks, promises, or async/await constructs) to handle the result.

_Example_: Consider a web server handling multiple client requests. Using asynchronous operations, the server can initiate data retrieval for one client and, while waiting for the data, start handling another client's request. This ensures the server remains responsive and efficient, even under heavy load.

Such asynchronous computations usually provide their result as a `Future` or if the result has multiple parts, as a `Stream`. To interact with these asynhronous results, you can use the `async` and `await` keyword.

### Callbacks
Read more about the definition of a callback function <a href="https://github.com/PranavBawgikar/js-notes/blob/main/javascript/callback-function.md">here</a>.

Example 1:
```dart
void fetchData(Function callback) {
  // Simulate a delay to mimic an asynchronous operation
  Future.delayed(Duration(seconds: 2), () {
    print('Data fetched from the server.');
    // Execute the callback function after fetcing data
    callback();
  });
}

void main() {
  print('Fetching data...');
  fetchData(() {
    print('Callback executed: Data processing completed.');
  });
}
```
The `fetchData()` function accepts another function as a parameter, named `callback`. Inside `fetchData`, we simulate a network request or any asynchronous operation using `Future.delayed`, which waits for 2 seconds before executing the code inside it's callback. After the delay, it prints a message indicating that data has been fetched and then calls the `callback` function.

In the `main` function we then call `fetchData` and provide an anonymous function (a function without a name) as the callback. Note, it's not mandatory to pass an anonymous function as a callback. We can also pass named functions.

In Dart, `Function` is a built-in type that represents a function. Since functions are first-class objects in Dart, they can be assigned to variables, passed as arguments, or returned from other functions. Using `Function` as a type annotation indicates that the parameter accepts a function, but it does not specify the function's signature (i.e., the number and types of paramters or it's return type).

`Future.delayed` is a constructor in Dart's `Future` class that creates a future which completes after a specified duration. `Duration` is a class in Dart that represents a span of time. It is used to specify time intervals in various time-related functions. In the context of `Future.delayed`, `Duration` defines how long the future should wait before completing. You can specify duration in different units such as days, hours, minutes, seconds and milliseconds.

### `async` and `await` Keyword
Example 1:
```dart
import 'dart:async';

// Simulate an asynchronous operation that fetches user data
Future<String> fetchUserData() async {
  // Simulate a network delay
  await Future.delayed(Duration(seconds: 2));
  return 'User data retrieved';
}

void main() async {
  print('Fetching user data...');
  // Await the asynchronous operation
  String data = await fetchUserData();
  
  print(data);
  print('Operation completed.');
}
```
Sequence of execution:
1. `main` starts and prints `Fetching user data...`.
2. `main` calls `await fetchUserData();`, pausing until `fetchUserData` completes.
3. `fetchUserData` starts, awaits a 2 second delay and then prints `User data retrieved`.
4. After `fetchUserData` completes, `main` resumes and prints `Operation completed`.

The `fetchUserData` function is marked as `async` as it performs asynchronous operations and returns a `Future`. After the delay simulation it returns a string `User data retrieved`.

The `main` function is also marked as `async` to allow the use of `await` within it. The line `String data = await fetchUserData();` calls the asynchronous `fetchUserData` function and waits for it to complete. During the wait, other operations can continue executing, making the program non-blocking.

`Future<String>` indicates that the future will eventually produce a value of type `String`. 

Example 2:
```dart
void main() async {
  final post = await fetchPost();
  print(post.title);
  print(post.userId);
}

Future<Post> fetchPost() {
  const delay = Duration(seconds: 3);
  
  return Future.delayed(delay, () {
    return Post('my post', 123);
  });
}

class Post {
  String title;
  int userId;
  
  Post(this.title, this.userId);
}

// my post
// 123
```
To make a delay we require the duration object and in Dart we make use of the `Duration` class to achieve that. Inside `Duration` we pass a named parameter called `seconds`.

### Futures

#### `Future` class
Futures in Dart are promises in JavaScript. A `future` is an instance of `Future` class. A `future` represents the result of an asynchronous operation and can have two states: completed and uncompleted. They represent the results of an asynchronous task that takes some time to complete.

##### Uncompleted
When you call an asynchronous function, it immediately returns a `Future` object that is in an uncompleted state. This `Future` represents a promise that a result (or an error) will be available at some point in the future.
That `future` is waiting for the function's asynchronous operation to finish or to throw an error. An uncompleted state is a state which the future will have from the moment the request was made up until a response comes back.

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
The `fetchData` function simulates a network request by returning a `Future` that completes after a 2 second delay with the string `Data Loaded`. When the `fetchData` is called in the `main` function, it returns immediately with an uncompleted `Future`. We print the uncompleted `Future` object, which outputs something like `Instance of '_Future<String>'`. We then register a callback using the `then` method to handle the value once the `Future` completes. After the 2 second delay, the `Future` completes, and the callback is invoked, printing `Future completed with: Data loaded`.

##### Completed
If the asynchronous operation succeeds, the `future` completes with a value. Otherwise, it completes with an error. In simple words, a completed state is a state in which the future gets resolved or completed into either a response value or an error.

###### Completing with a value
A `future` of type `Future<T>` completes with a value of type `T`. For example, a `future` with type `Future<String>` produces a string value. If a `future` doesn't produce a usable value, then the future's type if `Future<void>`.

###### Completing with an error
If the asynchronous operation performed by the function fails for any reason, the `future` completes with an error.

### FutureBuilder
`FutureBuilder` is used to build Flutter widgets when a Future is involved. `FutureBuilder` lets you determine the current state of a Future. Imagine you're building a Flutter app, and you want to show some information that takes a bit of time to get, like fetching data from the internet. The FutureBuilder widget helps you manage this by automatically updating your app's display based on whether the data is still loading, has arrived, or if there was an error.

Here's a simple way to understand it. When waiting for data or fetching the data, `FutureBuilder` can show a loading spinner to let users know something is happening. When data is received successfully, `FutureBuilder` displays it on the screen and if an error occurs or if there's a problem fetching the data, `FutureBuilder` shows an error message.
