import 'package:equatable/equatable.dart';
import 'package:movie_app/bloc/bloc.dart';

abstract class MovieEvent extends Equatable{
  const MovieEvent();
}

class FetchMovieList extends MovieEvent{
  const FetchMovieList();

  @override
  List<Object>get props => [];
}