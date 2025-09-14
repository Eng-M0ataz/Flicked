import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flickd/core/errors/Failure/failure.dart';
import 'package:flickd/features/home/data/data_source/home_local_data_source.dart';
import 'package:flickd/features/home/data/data_source/home_remote_data_sourece.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/domin/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies({
    int pageNumber = 1,
  }) async {
    try {
      List<MovieEntity> movies;
      movies = localDataSource.getPopularMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      } else {
        movies = await remoteDataSource.getPopularMovies(
          pageNumber: pageNumber,
        );
        return right(movies);
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcommingMovies({
    int pageNumber = 1,
  }) async {
    try {
      List<MovieEntity> movies;
      movies = localDataSource.getUpcommingMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      } else {
        movies =
            await remoteDataSource.getUpcommingMovies(pageNumber: pageNumber);
        return right(movies);
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
