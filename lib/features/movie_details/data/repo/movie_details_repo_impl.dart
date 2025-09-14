import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flickd/core/errors/Failure/failure.dart';
import 'package:flickd/features/movie_details/data/data_source/movie_detials_remote_data_source.dart';
import 'package:flickd/features/movie_details/domin/repo/movie_details_repo.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetialsRemoteDataSource movieDetailsRemoteDataSource;
  MovieDetailsRepoImpl({
    required this.movieDetailsRemoteDataSource,
  });

  @override
  Future<Either<Failure, String>> getMovieYouTubeLink({
    required String movieId,
  }) async {
    try {
      String youtubeLink = await movieDetailsRemoteDataSource
          .getMovieYouTubeLink(movieId: movieId);
      return right(youtubeLink);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    }
  }
}
