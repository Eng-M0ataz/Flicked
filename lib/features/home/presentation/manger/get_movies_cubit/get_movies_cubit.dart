import 'package:flickd/features/home/data/repo/home_repo_impl.dart';
import 'package:flickd/features/home/presentation/manger/get_movies_cubit/get_movies_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieCubit extends Cubit<PopularMoviesCubitState> {
  PopularMovieCubit({required this.homeRepoImpl})
      : super(PopularMoviesInitialState());
  final HomeRepoImpl homeRepoImpl;
  Future<void> getPopularMovies({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(PopularMoviesLoadingState());
    } else {
      emit(PopularMoviesPaginationLoadingState());
    }

    var result = await homeRepoImpl.getPopularMovies(pageNumber: pageNumber);
    result.fold(
      (failure) {
        emit(
          PopularMoviesFailureState(errorMessage: failure.errorMessage),
        );
      },
      (moviesList) {
        final defaultBackground = moviesList[0].imageUrl;

        emit(
          PopularMoviesSuccState(
            moviesList: moviesList,
            movieImageUrl: defaultBackground,
          ),
        );
      },
    );
  }

  void updateBackgroundImage({required String newImageUrl}) {
    if (state is PopularMoviesSuccState) {
      final currentState = state as PopularMoviesSuccState;
      emit(
        PopularMoviesSuccState(
          moviesList: currentState.moviesList,
          movieImageUrl: newImageUrl,
        ),
      );
    }
  }
}
