import 'dart:developer';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickd/core/utils/constants/sizes.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/presentation/widgets/movie_details.dart';
import 'package:flickd/features/home/presentation/widgets/movie_image_widget.dart';
import 'package:flickd/features/movie_details/presentation/widgets/custom_background_container.dart';
import 'package:flickd/features/movie_details/presentation/widgets/youtube_player.dart';
import 'package:flutter/material.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({
    super.key,
    required this.movieEntity,
  });
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    log(width.toString());
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: CachedNetworkImage(
              imageUrl: movieEntity.imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMd),
          children: [
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: MovieImageCustomWidget(
                image: movieEntity.imageUrl,
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomBackGroundContainer(
                child: Text(
                  movieEntity.movieTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomBackGroundContainer(
                child: MovieDetails(
                  movieEntity: movieEntity,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
            CustomBackGroundContainer(
              child: Text(
                movieEntity.movieDescruption,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  height: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Movie Trailer',
            ),
            const SizedBox(
              height: 10,
            ),
            const YoutubePlayerCustomWidget(),
            const SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
