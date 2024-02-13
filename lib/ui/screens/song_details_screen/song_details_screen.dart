import 'package:android_lyrics_player/controller/bloc/song_details_bloc/song_detail_bloc.dart'
    as sdb;
import 'package:android_lyrics_player/controller/bloc/song_lyrics_bloc/song_lyrics_bloc.dart'
    as lyb;
import 'package:android_lyrics_player/ui/screens/song_details_screen/song_details_widget.dart';
import 'package:android_lyrics_player/ui/screens/song_details_screen/song_lyrics_widget.dart';
import 'package:android_lyrics_player/ui/widgets/loading_widget.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/internet_cubit.dart';
import '../../../core/themes/app_theme.dart';
import '../../../utils/constants/strings.dart';
import '../../widgets/message_view.dart';

class SongDetailScreen extends StatelessWidget {
  static const routeName = Strings.songDetailsRoute;

  SongDetailScreen({Key? key, required this.title, required this.trackId})
      : super(key: key);

  final String title;
  final String trackId;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

  @override
  Widget build(BuildContext context) {
    /* final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String trackId  = args.arg1!;*/
    _assetsAudioPlayer.open(Audio("assets/my_audio.mp3"),
        autoStart: true, showNotification: true, loopMode: LoopMode.single);

    //_assetsAudioPlayer.dispose();

    debugPrint("Track ID Received: $trackId");
    BlocProvider.of<sdb.SongDetailsBloc>(context)
        .add(sdb.LoadSongDetailEvent(trackId));
    BlocProvider.of<lyb.SongLyricsBloc>(context)
        .add(lyb.LoadSongLyricsEvent(trackId));

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _assetsAudioPlayer.dispose();
        //trigger leaving and use own data
        Navigator.pop(context, false);
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: AppTheme.primaryLight,
            iconTheme: IconThemeData(
              color: Colors.white, // Set your desired back button color
            )),
        body: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
          if (state is InternetConnected) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CachedNetworkImage(
                        height: 200,
                        width: 200,
                        imageUrl: Strings.iconPlayUrl,
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/album_art.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      BlocBuilder<sdb.SongDetailsBloc, sdb.SongDetailState>(
                        builder: (context, state) {
                          if (state is sdb.SongLoadingState) {
                            return loadingWidget();
                          } else if (state is sdb.SongLoadedState) {
                            return SongDetailView(state.song);
                          } else if (state is sdb.SongErrorState) {
                            return showMessageView(
                                message: "API Limit Exhausted!");
                          } else {
                            return showMessageView();
                          }
                        },
                      ),
                      BlocBuilder<lyb.SongLyricsBloc, lyb.SongLyricsState>(
                        builder: (context, state) {
                          if (state is lyb.SongLoadingState) {
                            return Container();
                          } else if (state is lyb.SongLoadedState) {
                            return SongLyricsView(state.song);
                          } else if (state is lyb.SongErrorState) {
                            return showMessageView(
                                message: "API Limit Exhausted!");
                          } else {
                            return showMessageView();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is InternetDisconnected) {
            return showMessageView(message: "No Internet Available");
          } else {
            return showMessageView();
          }
        }),
      ),
    );
  }
}
