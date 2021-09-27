import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '22cbfe96e18c6be1c94df49762603514';
  List<Movie> onDisplayMovies = [];
  List<Movie> listOfPopularMovies = [];
  Map<int, List> moviesCast = {};
  int _popularPage = 0;
  final String _language = 'es-ES';
  MoviesProvider() {
    //print("inicializacion de la clase");
    this.getNowMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, '/3/movie/$endpoint', {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  Future<List<CastElement>> getMovieCast(int movieid) async {
    var url = Uri.https(_baseUrl, '/3/movie/$movieid/credits', {
      'api_key': _apiKey,
      'language': _language,
    });
    final response = await http.get(url);
    final creditsResponse = Cast.fromJson(response.body);
    moviesCast[movieid] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  getNowMovies() async {
    final String jsonData = await _getJsonData('now_playing');
    final mapResponse = NowplayingResponse.fromJson(jsonData);
    onDisplayMovies = mapResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final String jsonData = await this._getJsonData('popular', _popularPage);
    final mapResponse = PopularMovies.fromJson(jsonData);
    listOfPopularMovies = [...listOfPopularMovies, ...mapResponse.results];
    notifyListeners();
  }

  void getSuggestionsByQuery(String query) {}
}
