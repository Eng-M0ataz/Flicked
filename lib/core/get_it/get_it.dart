import 'package:dio/dio.dart';
import 'package:flickd/core/services/api_service.dart';
import 'package:flickd/core/services/secure_storge.dart';
import 'package:flickd/core/utils/constants/api_endpoints.dart';
import 'package:flickd/features/home/data/data_source/home_local_data_source.dart';
import 'package:flickd/features/home/data/data_source/home_remote_data_sourece.dart';
import 'package:flickd/features/home/data/repo/home_repo_impl.dart';
import 'package:flickd/features/movie_details/data/data_source/movie_detials_remote_data_source.dart';
import 'package:flickd/features/movie_details/data/repo/movie_details_repo_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  final accessToken = await Stroge.read(key: Api.accessTokenKey);
  final baseUrl = await Stroge.read(key: Api.baseUrlKey);
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<MovieDetailsRepoImpl>(
    MovieDetailsRepoImpl(
      movieDetailsRemoteDataSource: MovieDetialsRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
        baseUrl: baseUrl,
        accessToken: accessToken,
      ),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      localDataSource: HomeLocalDataSourceImpl(),
      remoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
        baseUrl: baseUrl,
        accessToken: accessToken,
      ),
    ),
  );
}
