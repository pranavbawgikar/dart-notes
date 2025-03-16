## MVVM Architecture
Model-View-ViewModel (MVVM) architecture provides a structured and organized approach to building applications. It is a software design pattern that separates the application's business logic from the UI, making the codebase more modular and testable. The architecture is separated into two sections, the UI and the data layer. The UI section is divided into two parts: `View` and `ViewModel`. The `View` is the actual UI and each View needs to have a one-to-one relationship with the `ViewModel`. This `ViewModel` is where all the business logic happens, in other words, the `View` should not do any logic itself unless it's directly tied to the UI.

The key part that the `View` model needs to do is expose a listenable for the view to update whenever the data changes. `Model` represents the data and is responsible for handling the data operations.
### Components
- Model: It represents the application's data layer, such as network requests, databases and APIs.
- View: The UI component, which listens for changes from the ViewModel and updates the UI accordingly.
- ViewModel: It serves as the intermediary between the View and the Model, holding the app's logic and managing the data flow between the two.

To keep the architecture clean, the Flutter project is generally structured as:
```bash
lib/
│
├── models/
├── services/
├── viewmodels/
├── views/
```
Let’s assume we are building a simple app that fetches a list of books. The model will represent the book data.
```dart
// models/book_model.dart
class Book {
  final String title;
  final String author;

  Book({required this.title, required this.author});
}
```
Now, creating the Service (Data Layer). The service will handle the network requests and provide data to the ViewModel. For this example, we’ll use a simple service to simulate fetching data.
```dart
// services/book_service.dart
import 'package:mvvm_example/models/book_model.dart';

class BookService {
  Future<List<Book>> fetchBooks() async {
    // Simulating network request
    await Future.delayed(Duration(seconds: 2));
    return [
      Book(title: 'Clean Code', author: 'Robert C. Martin'),
      Book(title: 'Effective Dart', author: 'Google'),
    ];
  }
}
```
This class acts as the data layer which handles network requests and preovides data to the ViewModel. `fetchBook()` is a asynchronous method which returns a `Future` that resolves to a list of `Book` objects.
`await Future.delayed(Duration(seconds: 2));` simulates a 2 second delay which mimics the latency of a real network request. After the delay, it returns a list containing two `Book` instances with predefined titles and authors.
In the MVVM pattern, the service layer is responsible for data retrieval and business logic.

Creating the ViewModel:
```dart
// viewmodels/book_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:mvvm_example/models/book_model.dart';
import 'package:mvvm_example/services/book_service.dart';

class BookViewModel extends ChangeNotifier {
  final BookService _bookService = BookService();
  List<Book> _books = [];
  bool _loading = false;

  List<Book> get books => _books;
  bool get loading => _loading;

  Future<void> fetchBooks() async {
    _loading = true;
    notifyListeners();
    
    _books = await _bookService.fetchBooks();
    
    _loading = false;
    notifyListeners();
  }
}
```
The `BookViewModel` class serves as the intermediary between the user interface (View) and the data layer (Model) in the MVVM architecture. The primary responsibility of this class is to manage the state of the book data and facilitate communication with the `BookService` to fetch this data.
The `BookViewModel` is extended from `ChangeNotifier` class which enables the class to notify listeners about changes, which is required for updating the UI in response to data changes.

`_books` is a private list which holds the fetched books. `_loading` is a private boolean which indicates whether a data fetch operation is in progress. `books` is a public getter function which exposes the `_books` list to external entities.
`loading` is another public getter function that exposes the `_loading` state to indicate loading status. The `fetchBooks()` method is an asynchronous method that fetches books from `_bookService`.

Sets `_loading` to `true` and calls `notifyListeners()` to update any listeners (typically the UI) about the loading state. Awaits the result from `_bookService.fetchBooks()` and assigns it to `_books`.
Sets `_loading` to `false` and calls `notifyListeners()` again to indicate that loading has completed and new data is available.

<br />

Example 1:

_item_view.dart_
```dart
import 'package:flutter/material.dart';
import 'package:untitled/demo.dart';
import 'package:untitled/item_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({ Key? key }) : super( key: key );

  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final ItemViewModel itemViewModel = ItemViewModel();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: ListView(
        children: [
          for(int i = 0; i < itemViewModel.items.length; i++)
            ListTile(
              title: Text(itemViewModel.items.elementAt(i).name),
            ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                itemViewModel.addItem('Item 10');
              });
            },
            child: Text('Add Item 10')
          )
        ],
      ),
    );
  }
}
```
_item_viewmodel.dart_
```dart
import 'package:untitled/item_model.dart';

class ItemViewModel {
  List<ItemModel> items = [
    ItemModel(name: 'Item 1'),
    ItemModel(name: 'Item 2'),
    ItemModel(name: 'Item 3'),
    ItemModel(name: 'Item 4'),
  ];

  addItem(String name) {
    items.add(ItemModel(name: name));
  }
}
```
_item_model.dart_
```dart
class ItemModel {
  final String name;

  ItemModel({ required this.name });
}
```
