import 'package:flutter/material.dart';
//import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '5ae3e52ea74b48d3ec75ff90dbe78117';
  final String _lenguage = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    //print('MoviesProvider inicializado');

    getOnDisplayMovie();
    getPopularMovies();
  }

  getOnDisplayMovie() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'lenguage': _lenguage,
      'page': '1',
    });

    //Await the http get response, the decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    //final  Map<String, dynamic> decodeData = json.decode(response.body);

    //print(nowPlayingResponse.results[1].title);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'lenguage': _lenguage,
      'page': '1',
    });

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    //Toma las peliculas actuales ...popularMovies, y le concatenas todo los resultados  investigar operador spred ...
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
