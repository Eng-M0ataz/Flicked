// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flickd/core/services/api_service.dart';
import 'package:flickd/core/services/secure_storge.dart';
import 'package:flickd/core/utils/constants/api_endpoints.dart';
import 'package:flickd/core/utils/constants/hive_constants.dart';
import 'package:flickd/core/utils/functions/save_data_localy.dart';
import 'package:flickd/features/home/data/models/move_model.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> getPopularMovies({int pageNumber = 1});
  Future<List<MovieEntity>> getUpcommingMovies({int pageNumber = 1});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  final String baseUrl;
  final String accessToken;
  HomeRemoteDataSourceImpl({
    required this.apiService,
    required this.baseUrl,
    required this.accessToken,
  });

  Future<String> getImageBaseUrl() async {
    String baseImageUrl = await Stroge.read(key: Api.baseImageUrlKey);
    return baseImageUrl;
  }

  List<MovieEntity> storeMoviesDataToList(moviesData, imageBaseUrl) {
    List<MovieEntity> moviesList = [];

    for (var movie in moviesData['results']) {
      moviesList.add(
        MovieModel.fromJson(
          json: movie,
          imageBaseUrl: imageBaseUrl,
        ),
      );
    }
    return moviesList;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies({int pageNumber = 1}) async {
    Map<String, dynamic> moviesData = await apiService.getReq(
      pageNumber: pageNumber,
      baseUrl: baseUrl,
      endPoint: Api.popularMoviesEndPoint,
      token: accessToken,
    );

    String imageBaseUrl = await getImageBaseUrl();
    List<MovieEntity> moviesList =
        storeMoviesDataToList(moviesData, imageBaseUrl);
    saveDataLocally(boxName: HiveConstants.popularMovieBox, data: moviesList);
    return moviesList;
  }

  @override
  Future<List<MovieEntity>> getUpcommingMovies({int pageNumber = 1}) async {
    Map<String, dynamic> moviesData = await apiService.getReq(
      pageNumber: pageNumber,
      baseUrl: baseUrl,
      endPoint: Api.upComingMoviesEndPoint,
      token: accessToken,
    );
    String imageBaseUrl = await getImageBaseUrl();
    List<MovieEntity> moviesList =
        storeMoviesDataToList(moviesData, imageBaseUrl);
    saveDataLocally(boxName: HiveConstants.upcomingMovieBox, data: moviesList);

    return moviesList;
  }
}
