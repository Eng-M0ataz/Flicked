import 'package:hive/hive.dart';
part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String movieTitle;
  @HiveField(3)
  final String movieLanguage;
  @HiveField(4)
  final String isAdult;
  @HiveField(5)
  final String movieReleaseDate;
  @HiveField(6)
  final String movieAvarageVote;
  @HiveField(7)
  final String movieDescruption;

  const MovieEntity({
    required this.imageUrl,
    required this.movieId,
    required this.movieTitle,
    required this.movieLanguage,
    required this.isAdult,
    required this.movieReleaseDate,
    required this.movieAvarageVote,
    required this.movieDescruption,
  });
}
