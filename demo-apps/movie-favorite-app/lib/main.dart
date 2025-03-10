import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/movie_providers.dart';
import 'package:untitled/selected_movies.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    var fav = context.watch<MovieProvider>().favList;

    return MaterialApp(
      title: 'Demo',
      home: Scaffold(
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedMovies()));
              }
            );
          },
        ),
        appBar: AppBar(
          title: Text('Your have ${fav.length} favorite movies.'),
        ),
        body: ListView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Movie ${index + 1}'),
              trailing: GestureDetector(
                onTap: () {
                  if(!fav.contains(index)) {
                    context.read<MovieProvider>().addToList(index);
                  } else {
                    context.read<MovieProvider>().removeFromList(index);
                  }
                },
                child: Icon(
                  Icons.favorite,
                  color: fav.contains(index) ? Colors.red : Colors.grey,
                )
              ),
            );
          }
        ),
      ),
    );
  }
}
