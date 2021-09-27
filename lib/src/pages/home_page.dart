import 'package:flutter/material.dart';
import 'package:peliculas_app/src/providers/movies_provider.dart';
import 'package:peliculas_app/src/search/search_delegate.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cines"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwipper(
              movies: moviesProvider.onDisplayMovies,
            ),
            MovieSlider(
              movies: moviesProvider.listOfPopularMovies,
              onNextPage: () {
                moviesProvider.getPopularMovies();
              },
            ),
          ],
        ),
      ),
    );
  }
}
