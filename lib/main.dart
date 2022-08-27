import 'dart:ffi';

import 'package:android_lyrics_player/controller/bloc/song_bloc.dart';
import 'package:android_lyrics_player/data/repositories/song_repository.dart';
import 'package:android_lyrics_player/utils/constants/strings.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/cubit/internet_cubit.dart';
import 'controller/debug/app_bloc_observer.dart';
import 'core/router/app_router.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
    key: null,
    songRepository: SongRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  final SongRepository songRepository;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
    required this.songRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<SongBloc>(
            create: (songBlocContext) => SongBloc(songRepository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
