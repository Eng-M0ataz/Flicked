import 'package:flickd/core/get_it/get_it.dart';
import 'package:flickd/core/utils/constants/hive_constants.dart';
import 'package:flickd/core/utils/constants/sizes.dart';
import 'package:flickd/core/utils/functions/block_observer.dart';
import 'package:flickd/core/utils/router/app_router.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/presentation/manger/Movie_list_toogle_cubit/movies_list_toggle_cubit.dart';
import 'package:flickd/features/home/presentation/manger/upcomming_movie_cubit/upcoming_movie_cubit.dart';
import 'package:flickd/features/home/presentation/manger/get_movies_cubit/get_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/utils/functions/store_credentials.dart';
import 'features/home/data/repo/home_repo_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await dotenv.load();
  await storeCredentials();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(HiveConstants.popularMovieBox);
  await Hive.openBox<MovieEntity>(HiveConstants.upcomingMovieBox);
  Bloc.observer = BlockObserver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const Flickd());
}

class Flickd extends StatelessWidget {
  const Flickd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularMovieCubit(
            homeRepoImpl: getIt<HomeRepoImpl>(),
          )..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) => MoviesListToggleCubit()..showPopularMovies(),
        ),
        BlocProvider(
          create: (context) => UpcomingMovieCubit(
            homeRepoImpl: getIt<HomeRepoImpl>(),
          )..getupcommingMovies(),
        ),
      ],
      child: MaterialApp.router(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: AppSizes.appBreakPoints,
          breakpointsLandscape: AppSizes.appLandscapeBreakPoints,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark(),
      ),
    );
  }
}
