import 'package:flickd/core/get_it/get_it.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/movie_details/data/repo/movie_details_repo_impl.dart';
import 'package:flickd/features/movie_details/presentation/manger/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({
    super.key,
    required this.movieEntity,
  });
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MovieDetailsCubit(
          movieDetailsRepoImpl: getIt.get<MovieDetailsRepoImpl>(),
        )..getMovieYouTubeLink(movieId: movieEntity.movieId.toString()),
        child: MovieDetailsViewBody(
          movieEntity: movieEntity,
        ),
      ),
    );
  }
}
