import 'package:android_lyrics_player/ui/screens/ScreenArguments.dart';
import 'package:android_lyrics_player/ui/screens/home_screen/song_details_screen.dart';
import 'package:flutter/material.dart';

import '../../ui/screens/home_screen/home_screen.dart';
import '../../utils/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';

class AppRouter {
  AppRouter();

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as ScreenArguments;

    switch (settings.name) {
      case Strings.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: Strings.homeScreenTitle,
          ),
        );
      case Strings.songDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => SongDetailScreen(
            title: Strings.detailsScreenTitle,
            trackId: args.arg1!,
          ),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
