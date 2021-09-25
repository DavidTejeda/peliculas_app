import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '22cbfe96e18c6be1c94df49762603514';
  final String _language = 'es-ES';
  MoviesProvider() {
    print("inicializacion de la clase");
    this.getNowMovies();
  }

  getNowMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final mapResponse = NowplayingResponse.fromJson(response.body);
    print(mapResponse.results[0].title);
  }
}
