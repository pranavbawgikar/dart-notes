import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple To Do App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ToDoHomePage(),
    );
  }
}

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  _ToDoHomePageState createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  // List to hold To Do items
  final List<String> _todoItems = [];

  // Controller for the TextField
  final TextEditingController _textFieldController = TextEditingController();

  // Method to add a new task
  void _addTodoItem(String task) {
    if(task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
      _textFieldController.clear();
    }
  }

  // Method to build the list of to-do items
  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  // Widget for a single to-do item
  Widget _buildTodoItem(String task, int index) {
    return ListTile(
      title: Text(task),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _todoItems.removeAt(index);
          });
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple To-Do App'),
      ),
      body: Column(
        children: [
          // Expanded widget to display the list of tasks
          Expanded(child: _buildTodoList()),

          // Row that contains the text field and the add button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Text fields for imputting new tasks
                Expanded(
                  child: TextField(
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      labelText: 'Add Task',
                    ),
                  ),
                ),

                // Button to add the task to the list
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _addTodoItem(_textFieldController.text);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
