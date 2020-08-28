/*
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/model/movie_result.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent , MovieState>{

  final MovieRespository respository ;

  MovieBloc({@required this.respository}) : assert(respository != null), super(null);

  @override
  MovieState get initialState => MovieListEmpty() ;

  @override
  Stream<MovieState> mapEventToState(MovieEvent event)async* {
    if(event is FetchMovieList ){
      yield MovieListLoading();
      try{
        final Movie movie = await respository.fetchMovie() ;
        yield MovieListLoaded(movie: movie);

      }catch(_){
        yield MovieError();
      }
    }
  }

}*/
