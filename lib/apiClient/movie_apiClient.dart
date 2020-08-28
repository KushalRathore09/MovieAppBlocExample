import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_result.dart';
import 'package:movie_app/utils/string_resources.dart';

class MovieApiClient {
  final baseUrl = "https://api.themoviedb.org/3/ ";

  final http.Client httpClient;

  MovieApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<http.Response>fetchMovie() async{
    final url = '$baseUrl/movie/now_playing?$API_KEY';
    final respone = await this.httpClient.get(url);

    if(respone.statusCode != 200){
      throw new Exception('error getting movie list');
    }
    final json = jsonDecode(respone.body);
    return respone;
  }

  Future<Movie>searchMovie() async{
    final url = '$baseUrl/search/movie?$API_KEY';
    final response = await this.httpClient.get(url,headers: {});

    if(response.statusCode != 200){
      throw new Exception('error getting searched item');
    }
    final json = jsonDecode(response.body);
    return Movie.fromJson(json);
  }

}
