import 'package:flickd/features/home/domin/entity/movie_entity.dart';

sealed class UpcommingMoviesCubitState {}

class UpcomingMovieInitial extends UpcommingMoviesCubitState {}

class UpcommingMoviesLoadingState extends UpcommingMoviesCubitState {}

class UpcommingMoviesPaginationLoadingState extends UpcommingMoviesCubitState {}

class UpcommingMoviesSuccState extends UpcommingMoviesCubitState {
  final List<MovieEntity> moviesList;
  final String movieImageUrl;
  UpcommingMoviesSuccState({
    required this.moviesList,
    required this.movieImageUrl,
  });
}

class UpcommingMoviesFailureState extends UpcommingMoviesCubitState {
  final String errorMessage;
  UpcommingMoviesFailureState({
    required this.errorMessage,
  });
}
