part of 'movies_list_toggle_cubit.dart';

@immutable
sealed class MoviesListToggleState {}

final class MoviesListToggleInitial extends MoviesListToggleState {}

final class MoviesListTogglePopular extends MoviesListToggleState {}

final class MoviesListToggleUpcomming extends MoviesListToggleState {}
