import 'package:flickd/core/services/api_service.dart';
import 'package:flickd/core/utils/constants/api_endpoints.dart';

abstract class MovieDetialsRemoteDataSource {
  Future<String> getMovieYouTubeLink({required String movieId});
}

class MovieDetialsRemoteDataSourceImpl implements MovieDetialsRemoteDataSource {
  final ApiService apiService;
  final String baseUrl;
  final String accessToken;
  MovieDetialsRemoteDataSourceImpl({
    required this.apiService,
    required this.baseUrl,
    required this.accessToken,
  });
  @override
  Future<String> getMovieYouTubeLink({required String movieId}) async {
    Map<String, dynamic> movieData = await apiService.getReq(
      endPoint:
          '${Api.moiveVideosEndPointPartOne}$movieId${Api.moiveVideosEndPointPartTwo}',
      baseUrl: baseUrl,
      token: accessToken,
    );
    String youtubeLink = '';
    for (var video in movieData['results']) {
      if (video['name'] == 'Official Trailer' && video['type'] == 'Trailer') {
        youtubeLink = video['key'];
      } else {
        return youtubeLink = movieData['results'][0]['key'];
      }
    }
    return youtubeLink;
  }
}
