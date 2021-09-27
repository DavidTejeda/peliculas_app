import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "Buscar pelicula";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("BuiResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined,
              size: 130, color: Colors.black26),
        ),
      );
    }
    return Container();
  }
}
