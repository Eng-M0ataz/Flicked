import 'package:flickd/features/home/domin/entity/movie_entity.dart';

sealed class PopularMoviesCubitState {}

class PopularMoviesInitialState extends PopularMoviesCubitState {}

class PopularMoviesLoadingState extends PopularMoviesCubitState {}

class PopularMoviesPaginationLoadingState extends PopularMoviesCubitState {}

class PopularMoviesSuccState extends PopularMoviesCubitState {
  final List<MovieEntity> moviesList;
  final String movieImageUrl;
  PopularMoviesSuccState({
    required this.moviesList,
    required this.movieImageUrl,
  });
}

class PopularMoviesFailureState extends PopularMoviesCubitState {
  final String errorMessage;
  PopularMoviesFailureState({
    required this.errorMessage,
  });
}
