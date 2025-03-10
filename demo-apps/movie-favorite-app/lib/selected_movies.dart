import 'package:flutter/material.dart';
import 'providers/movie_providers.dart';
import 'package:provider/provider.dart';

class SelectedMovies extends StatelessWidget {
  const SelectedMovies({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    var fav = context.watch<MovieProvider>().favList;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your selected movies'),
        ),
        body: ListView.builder(
          itemCount: fav.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Movie ${fav[index] + 1}'),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removeFromList(fav[index]);
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
