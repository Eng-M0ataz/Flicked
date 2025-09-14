import 'package:flickd/core/utils/router/app_router.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/presentation/widgets/movie_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../manger/get_movies_cubit/get_movies_cubit.dart';

class PopularMovieListView extends StatefulWidget {
  const PopularMovieListView({
    super.key,
    required this.movieEntity,
    required this.isLoading,
  });
  final List<MovieEntity> movieEntity;
  final bool isLoading;

  @override
  State<PopularMovieListView> createState() => _PopularMovieListViewState();
}

class _PopularMovieListViewState extends State<PopularMovieListView> {
  late ScrollController scrollController;
  int currentPage = 2;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (isLoading == false) {
        isLoading = true;
        await context
            .read<PopularMovieCubit>()
            .getPopularMovies(pageNumber: currentPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemCount: widget.movieEntity.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, i) => GestureDetector(
        onTap: () {
          context.read<PopularMovieCubit>().updateBackgroundImage(
                newImageUrl: widget.movieEntity[i].imageUrl,
              );
        },
        child: CustomMovieItem(
          onpressed: () {
            context.pushNamed(
              AppRouter.kMovieDetailsView,
              extra: widget.movieEntity[i],
            );
          },
          isLoading: widget.isLoading,
          movieEntity: widget.movieEntity[i],
        ),
      ),
    );
  }
}
