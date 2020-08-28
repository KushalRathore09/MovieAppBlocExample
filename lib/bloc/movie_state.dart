import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/movie_result.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];

}

class MovieListEmpty extends MovieState{

}
class MovieListLoading extends MovieState{}

class MovieListLoaded extends MovieState{
  final Movie movie ;

  const MovieListLoaded({@required this.movie}) : assert(movie != null);

  @override
  List<Object> get props => [movie];
}
class MovieError extends MovieState{}