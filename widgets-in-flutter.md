## Widgets
### Scaffold
Scaffold in Flutter provides a default structure for the app. It provides standard components like the app bar, drawer, floating action button, and bottom navigation bar.

Example:
```dart
Scaffold(
  appBar: AppBar(
    title: Text('Home'),
  ),
  body: Center(
    child: Text('Welcome to the Home Page'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
);
```
<br />

### InkWell
In Flutter, the `InkWell` widget provides a visual response when a user interacts with a part of the application. It adds a 'ripple' effect to it's child widget upon touch. It can detect various gestures like taps, double taps, long presses, etc. In essence, `InkWell` is used whenever you want to make a non-interactive widget respond to touch or a visual effect.

Making images respond to taps by wrapping them with `InkWell`.
```dart
InkWell(
  onTap: () {
    // Handle image tap
  },
  child: Image.network('https://example.com/image.jpg'),
)
```

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('InkWell Example')),
        body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('InkWell tapped!')),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Tap Me',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```
The `InkWell` widget must have a `material` widget as an ancestor. In the above code, the `Scaffold` provides the necessary `Material` context.
#### Possible error scenarios
##### No ScaffoldMessenger widget found
This error occurs when the `ScaffoldMessenger.of(context)` method cannot locate a `ScaffoldMessenger` ancestor in the widget tree. This typically happens when the `context` used to call `ScaffoldMessenger.of(context)` is not under a `MaterialApp` or `Scaffold` widget, which are responsible for providing the `ScaffoldMessenger` context. The `onTap` callback of the `InkWell` widget attempts to show a `SnackBar` using `ScaffoldMessenger.of(context)`. However, if the `context` at this point does not have a `ScaffoldMessenger` ancestor usually introduced by the `MaterialApp`, Flutter would throw this exception.

To resolve this issue, we can ensure that the `context` used to call `ScaffoldMessenger.of(context)` is a descendant of a `ScaffoldMessenger` widget. One common approach is to wrap the widget that contains the `InkWell` in a `Builder` widget. The `Builder` widget provides a new context that is a descendant of the `Scaffold` which allows `ScaffoldMessenger.of(context)` to find the appropriate ancestor.

<br />

### Text
The `Text` widget displays a string of text with single style.

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ), // AppBar
        body: Center(
          child: Text(
            'Hello Flutter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ), // Text
        ), // Center
      ), // Scaffold
    ); // Material App
  }
}
```
<br />

### Center
In Dart, functions and constructors can have positional and named parameters. Positional parameters are specified in order and without names, while named parameters are identified by their names.

The `Center` widget accepts only one positional argument: the `child` parameter.

<br />

### Column & Row
`Column` and `Row` are flex widgets that arrange their children vertically and horizontally, respectively. In Flutter, the `mainAxisAlignment` and `crossAxisAlignment` properties are primarily used in the `Row` and `Column` widgets. These properties control how child widgets are aligned along the main and cross axes within these layouts.

<br />

#### `mainAxisAlignment`
Determines how children are aligned along the main axis (the primary direction) of the `Row` or `Column`.
- In a `Row`, this aligns children horizontally.
- In a `Column`, this aligns children vertically.

<br />

#### `crossAxisAlignment`
Determines how children are aligned along the cross axis (perpendicular to the main axis).
- In a `Row`, this aligns children vertically.
- In a `Column`, this aligns children horizontally.

Example 1:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ), // AppBar
        body: Stack( // To render a widget on top of another
          children: [
            Center(
              child: Text(
                'Hello Flutter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ), // Text
            ), // Center
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [ // Type-casting
                Icon(Icons.star),
                Icon(Icons.star_border),
              ], // <Widget> List
            ), // Row
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text('First Item'),
                Text('Second Item'),
              ], // <Widget> List
            ), // Column
          ] // <Widget> List
        ), // Stack
      ), // Scaffold
    ); // Material App
  }
}
```

Example 2:
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.indigo,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.indigoAccent,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.lightGreen,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    height: 50,
                    width: 100,
                  ),
                  Container(
                    color: Colors.amberAccent,
                    height: 50,
                    width: 100,
                  ),
                  Container(
                    color: Colors.indigoAccent,
                    height: 50,
                    width: 100,
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
```
In the `Row`, `mainAxisAlignment: MainAxisAlignment.spaceAround` distributes the child widgets horizontally with equal space around them and `crossAxisAlignment: CrossAxisAlignment.center` centers the children vertically within the row.

In the `Column`, `mainAxisAlignment: MainAxisAlignment.spaceBetween` places the first child at the top and the last child at the bottom, with the middle child centered vertically between them and `crossAxisAlignment: CrossAxisAlignment.start` aligns the children to the start of the horizontal axis (left side).

<br />

### Container
The `Container` widget can contain a child widget and apply padding, margins, borders, and background color.

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text('Contained Text'),
        )
    );
  }
}
```
<br />

### Stack
The `Stack` widget allows for the overlaying of widgets on top of each other.

Two important properties of the `Stack` widget that influence it's behavior are `fit` and `clipBehavior`.
#### `clipBehavior`
In computer graphics, the act of restricting the rendering to a particular area is called clipping. The `clipBehavior` property determines how the `Stack` handles it’s children when they overflow it’s boundaries. The default behavior for most of the widgets is `Clip.none`.

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          // overflow: Overflow.visible,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
            Positioned(
              top: 80,
              left: 80,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
```
In the above example, the green container is positioned such that it partially overflows the blue container. The `clipBehavior` property determines whether the overflowing part of the green container is rendered or clipped.

#### `fit`
The `fit` property controls how non-positioned children of the `Stack` are sized within the stack's constraints. It determines whether these children are allowed to take on their natural size or are forced to expand to fill the stack.
The possible values for `fit` are:
1. `StackFit.loose`: Non-positioned children can have any size upto their natural size, constrained by the stack's size.
2. `StackFit.expand`: Non-positioned children are forced to expand to fill the stack's size.
3. `StackFit.passthrough`: The constraints from the stack's parent are passed through to the non-positioned children without modification.

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Stack Fit Exmaple'),),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                color: Colors.blue,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              )
            ],
          ),
        )
      ),
    ),
  ));
}
```
<br />

### SizedBox
The `SizedBox` widget is used to create a box with a specified size.

Example:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Demo App'),
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Button'),
              ),
            ),
          )
      ),
    );
  }
}
```
<br />

### Builder
If you need to access an ancestor widget that is not available in the current context, wrapping the desired widget with a `Builder` provides a new context that is a descendant of the desired ancestor. While every widget has a `build` method that provides it's `BuildContext`, there are scenarios where the immediate `BuildContext` does not have access to certain ancestors in the widget tree. This is where the `Builder` widget becomes useful.

`BuildContext` knows where a widget is located in the widget tree which is essential for tasks like theme retrieval or navigation. It enables a widget to access information from it's ancestor widgets. For example, using `Theme.of(context)` retrieves the nearest `Theme` ancestor, allowing the widget to adapt to the application's theme.

Each widget has it's own `BuildContext`, which ensures that when methods like `Scaffold.of(context)` are called, they return the `Scaffold` related to that specific context.

<br />

### ListView
Consider a simple `Scaffold` with a `Column` widget. Inside the `Column` we have a basic `Container` of height 200. Now, in `Column` we can have multiple widgets inside and if you go adding widgets in the `Column`, it will likely get full and you will encounter something like this:
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
<img width="501" alt="Screenshot 2025-03-06 at 1 05 51 AM" src="https://github.com/user-attachments/assets/3a17269f-adf5-482e-92ab-6699b44c1f3f" />


Error:
```diff
The following assertion was thrown during layout:
A RenderFlex overflowed by 21 pixels on the bottom.
```
This is a situation where it will be appropriate to use a `ListView` and the crucial feature of a `ListView` is that it is scrollable.
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple[400],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
You can also disable scrolling for your list by using the `physics: NeverScrollableScrollPhysics(),` property. Another good coding practice is to encapsulate the code when you have a lot of widgets in your list. 

For example:

sqaure.dart
```dart
import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.deepPurple[400],
      ),
    );
  }
}
```
main.dart
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            MySquare(),
            MySquare(),
            MySquare(),
            MySquare(),
            MySquare(),
          ],
        ),
      ),
    );
  }
}
```
<br />

### `ListView.builder`
`ListView.builder` creates the list dynamically. In practice, you might not know how many objects to place in there, for instance, when we think of the instagram feed, it's never a fixed number of posts, in that case we would require a dynamic list.

In the `itemBuilder` we give the current context and the index and return the `MySquare()`. When you use builders you need to specify item count. But, what's really useful about this is that you don't have to specify a fixed number, you can just specify it as `_posts.length` and it will automatically create squares corresponding to the items in the list. 
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final List _posts = [
    'post 1',
    'post 2',
    'post 3',
    'post 4'
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        body: ListView.builder(
          itemCount: _posts.length, // itemCount: 2,
          itemBuilder: (context, index) {
            return MySquare();
          }),
      ),
    );
  }
}
```
<br />

### Expanded
The `Expanded` widget needs to be inside of either a `Row` or `Column` and it requires some space to fill. This widget has a `flex` property which is initially set to 1.

Example:
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                // flex: 4,
                child: Container(
                  color: Colors.blueGrey,
                )
            ),
            Expanded(
              flex: 5,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          color: Colors.green,
                        )
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
```
<br />

### Flexible
Example:
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Container(
                // height: 50,
                color: Colors.black38,
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                // height: 50,
                color: Colors.blueAccent,
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                // height: 50,
                color: Colors.cyanAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
```
<br />

### SingleChildScrollView
The `SingleChildScrollView` widget in Flutter allows a single child to be scrollable when it exceeds the available space. Consider an example, where you have a scrollable widget like a `ListView`, nested within another scrollable widget, such as a `SingleChildScrollView`.

Example:
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.deepOrangeAccent,
                child: const Center(
                  child: Text(
                    'Static Content',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                },
              ),
              Container(
                height: 200,
                color: Colors.indigo,
                child: const Center(
                  child: Text(
                      'More Static Content',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      )
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
```
<br />

### ConstrainedBox
This widget lets you specify the minimum and maximum heights of your child widgets. A constraint is nothing more than a set of 4 doubles: minimum heigth and width and maximum height and width. In a tree of widgets, we have parent widgets, these parent widgets give their constraints down to their child widgets.

`BoxConstraints` in Flutter, defines the constraints on the size of a widget. In simple terms, it describes the range of permissible sizes a widget can occupy within its parent. There are different types of `BoxConstraints`.

#### Tight Constraints
These force a widget to be of a specific size by setting both the minimum and maximum dimensions to the values.

Example:
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                // Tight Constraints
                minHeight: 100,
                minWidth: 100,
                maxHeight: 200,
                maxWidth: 200,
              ),
              child: Container(
                color: Colors.blueAccent,
              ),
            ),
          )
      ),
    );
  }
}
```

#### Unconstrained Box / Loose Constraints
Loose constraints give a widget some freedom within a range. For example, you might only set a maximum width and height if you want.

Example:
```dart
import 'package:flutter/material.dart';
import 'package:untitled/square.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
          body: Center(
            child: Container(
              // Loose Constraints
              constraints: BoxConstraints(
                maxWidth: 200,
                maxHeight: 300,
              ),
              child: Text(
                'Waiting for connection from debug service on Chrome... Restarted application in 1,003ms. Performing hot restart...',
                style: TextStyle(color: Colors.white),),
              color: Colors.indigo,
            )
          )
      ),
    );
  }
}
```
In this example, the container can grow up to 200 pixels in width and 300 pixels in height, but it’s not forced to be exactly those dimensions. If the content (in this case, the `Text` widget) is smaller, the container will shrink to fit.
