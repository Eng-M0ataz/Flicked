import 'package:dartz/dartz.dart';
import 'package:flickd/core/errors/Failure/failure.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, String>> getMovieYouTubeLink({
    required String movieId,
  });
}
