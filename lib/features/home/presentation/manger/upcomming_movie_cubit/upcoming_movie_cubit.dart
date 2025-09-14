import 'package:flickd/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcommingMoviesCubitState> {
  UpcomingMovieCubit({
    required this.homeRepoImpl,
  }) : super(UpcomingMovieInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> getupcommingMovies({
    int pageNumber = 1,
  }) async {
    if (pageNumber == 1) {
      emit(UpcommingMoviesLoadingState());
    } else {
      emit(UpcommingMoviesPaginationLoadingState());
    }
    emit(UpcommingMoviesLoadingState());
    var result = await homeRepoImpl.getUpcommingMovies(pageNumber: pageNumber);
    result.fold(
      (failure) => emit(
        UpcommingMoviesFailureState(errorMessage: failure.errorMessage),
      ),
      (moviesList) => emit(
        UpcommingMoviesSuccState(
          moviesList: moviesList,
          movieImageUrl: moviesList[0].imageUrl,
        ),
      ),
    );
  }

  void updateBackgroundImage({required String newImageUrl}) {
    if (state is UpcommingMoviesSuccState) {
      final currentState = state as UpcommingMoviesSuccState;
      emit(
        UpcommingMoviesSuccState(
          moviesList: currentState.moviesList,
          movieImageUrl: newImageUrl,
        ),
      );
    }
  }
}
