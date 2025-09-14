import 'package:bloc/bloc.dart';
import 'package:flickd/features/movie_details/data/repo/movie_details_repo_impl.dart';
import 'package:meta/meta.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepoImpl movieDetailsRepoImpl;
  MovieDetailsCubit({
    required this.movieDetailsRepoImpl,
  }) : super(MovieDetailsInitial());

  Future<void> getMovieYouTubeLink({required String movieId}) async {
    emit(MovieDetailsLoading());

    final result =
        await movieDetailsRepoImpl.getMovieYouTubeLink(movieId: movieId);
    result.fold(
      (failure) => emit(
        MovieDetailsFailure(
          errorMessage: failure.errorMessage,
        ),
      ),
      (youtubeLink) => emit(
        MovieDetailsSucc(
          movieYouTubeLink: youtubeLink,
        ),
      ),
    );
  }
}
