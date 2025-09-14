import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/presentation/views/home_view.dart';
import 'package:flickd/features/movie_details/presentation/view/movie_details_view.dart';
import 'package:flickd/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const kHomeView = '/HomeView';
  static const kMovieDetailsView = '/MovieDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        name: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kMovieDetailsView,
        name: kMovieDetailsView,
        builder: (context, state) => MovieDetailsView(
          movieEntity: state.extra as MovieEntity,
        ),
      ),
    ],
  );
}
