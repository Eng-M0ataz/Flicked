import 'package:flickd/core/utils/constants/hive_constants.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<MovieEntity> getPopularMovies({int pageNumber = 1, int pageSize = 19});
  List<MovieEntity> getUpcommingMovies({int pageNumber = 1, int pageSize = 19});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<MovieEntity> getPopularMovies({int pageNumber = 1, int pageSize = 19}) {
    int startIndex = (pageNumber - 1) * pageSize;
    int endIndex = startIndex + pageSize;
    var box = Hive.box<MovieEntity>(HiveConstants.popularMovieBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<MovieEntity> getUpcommingMovies(
      {int pageNumber = 1, int pageSize = 19}) {
    int startIndex = (pageNumber - 1) * pageSize;
    int endIndex = startIndex + pageSize;
    var box = Hive.box<MovieEntity>(HiveConstants.upcomingMovieBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
