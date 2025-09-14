import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movieEntity,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MovieEntity movieEntity;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Lang : ${movieEntity.movieLanguage.toUpperCase()}',
          style: const TextStyle(
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          ' | R : ${movieEntity.isAdult}',
          style: const TextStyle(
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          ' | Date : ${movieEntity.movieReleaseDate}',
          style: const TextStyle(
            fontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
