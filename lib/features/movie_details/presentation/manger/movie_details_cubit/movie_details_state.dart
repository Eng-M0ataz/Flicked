part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsSucc extends MovieDetailsState {
  final String movieYouTubeLink;
  MovieDetailsSucc({
    required this.movieYouTubeLink,
  });
}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailure({
    required this.errorMessage,
  });
}
