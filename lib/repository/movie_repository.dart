import 'package:flutter/cupertino.dart';
import 'package:movie_app/apiClient/movie_apiClient.dart';
import 'package:movie_app/model/movie_result.dart';

class MovieRespository{
  final MovieApiClient movieApiClient ;
  MovieRespository({@required this.movieApiClient}) : assert(movieApiClient != null);

}