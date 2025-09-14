import 'package:dartz/dartz.dart';
import 'package:flickd/core/errors/Failure/failure.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies({
    int pageNumber = 1,
  });
  Future<Either<Failure, List<MovieEntity>>> getUpcommingMovies({
    int pageNumber = 1,
  });
}
