import 'dart:convert';

import 'package:demos/constants.dart';
import 'package:demos/models/Movie.dart';
import 'package:http/http.dart' as http;

class apiService {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${constants.apiKey}';
  static const _upcomingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${constants.apiKey}';
  //Trending-SlideShow
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      //print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("error");
    }
  }

  //toprated/top picks
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      //print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("error");
    }
  }

  //Upcoming
  Future<List<Movie>> getUpcomingMovie() async {
    final response = await http.get(Uri.parse(_upcomingMovieUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      //print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("error");
    }
  }
}
