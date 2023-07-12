
import 'package:flutter/material.dart';
import 'package:arts_home/core/screens.dart' as screens;

import '../../data/response/movies_response.dart';
import '../../data/response/tv_shows_response.dart';

import '../screens/home_layout.dart';
import '../screens/movies/movie_details_screen.dart';

import '../screens/splash_screen.dart';
import '../screens/tv_shows/tv_shows_details_screen.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const SplashScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.movieDetailsScreen:
        MoviesResults movieModel = settings.arguments as MoviesResults;
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen(movieModel: movieModel));
      case screens.tvShowsDetailsScreen:
        StareResults tvShowsModel = settings.arguments as StareResults;
        return MaterialPageRoute(builder: (_) => TvShowsDetailsScreen(starsModel: tvShowsModel,));

      default:
        return null;
    }
  }
}