import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movies_list_toggle_state.dart';

class MoviesListToggleCubit extends Cubit<MoviesListToggleState> {
  MoviesListToggleCubit() : super(MoviesListTogglePopular());

  void showPopularMovies() {
    emit(MoviesListTogglePopular());
  }

  void showUpcomingMovies() {
    emit(MoviesListToggleUpcomming());
  }
}
