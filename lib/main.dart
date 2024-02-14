import 'dart:ffi';

import 'package:android_lyrics_player/controller/bloc/song_details_bloc/song_detail_bloc.dart'
    as sdb;
import 'package:android_lyrics_player/controller/bloc/song_lyrics_bloc/song_lyrics_bloc.dart'
    as lyb;
import 'package:android_lyrics_player/data/repositories/song_details_repository.dart';
import 'package:android_lyrics_player/data/repositories/song_lyrics_repository.dart';
import 'package:android_lyrics_player/data/repositories/song_repository.dart';
import 'package:android_lyrics_player/ui/screens/home_screen/home_screen.dart';
import 'package:android_lyrics_player/utils/constants/strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/bloc/song_list_bloc/song_list_bloc.dart' as slb;
import 'controller/cubit/internet_cubit/internet_cubit.dart';
import 'controller/debug/app_bloc_observer.dart';
import 'core/router/app_router.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
    key: null,
    songRepository: SongRepository(),
    songDetailsRepository: SongDetailsRepository(),
    songLyricsRepository: SongLyricsRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  final SongRepository songRepository;
  final SongDetailsRepository songDetailsRepository;
  final SongLyricsRepository songLyricsRepository;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
    required this.songRepository,
    required this.songDetailsRepository,
    required this.songLyricsRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<slb.SongBloc>(
            create: (songBlocContext) => slb.SongBloc(songRepository)),
        BlocProvider<sdb.SongDetailsBloc>(
            create: (songBlocContext) =>
                sdb.SongDetailsBloc(songDetailsRepository)),
        BlocProvider<lyb.SongLyricsBloc>(
            create: (songBlocContext) =>
                lyb.SongLyricsBloc(songLyricsRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(key: this.key,title: Strings.homeScreenTitle),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
