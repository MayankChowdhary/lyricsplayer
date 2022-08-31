import 'package:android_lyrics_player/controller/bloc/song_details_bloc/song_detail_bloc.dart'
    as sdb;
import 'package:android_lyrics_player/controller/bloc/song_lyrics_bloc/song_lyrics_bloc.dart'
    as lyb;
import 'package:android_lyrics_player/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/internet_cubit.dart';
import '../../../utils/constants/strings.dart';
import '../../widgets/message_view.dart';

class SongDetailScreen extends StatelessWidget {
  static const routeName = Strings.songDetailsRoute;

  const SongDetailScreen({Key? key, required this.title, required this.trackId})
      : super(key: key);

  final String title;
  final String trackId;

  @override
  Widget build(BuildContext context) {
    /* final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String trackId  = args.arg1!;*/

    debugPrint("Track ID Received: $trackId");
    BlocProvider.of<sdb.SongDetailsBloc>(context)
        .add(sdb.LoadSongDetailEvent(trackId));
    BlocProvider.of<lyb.SongLyricsBloc>(context)
        .add(lyb.LoadSongLyricsEvent(trackId));

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body:
          BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
        if (state is InternetConnected) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<sdb.SongDetailsBloc, sdb.SongDetailState>(
                  builder: (context, state) {
                    if (state is sdb.SongLoadingState) {
                      return loadingWidget();
                    } else if (state is sdb.SongLoadedState) {
                      return showMessageView(
                          message: "Song Details Loaded Successfully");
                    } else if (state is sdb.SongErrorState) {
                      return showMessageView(message: "API Limit Exhausted!");
                    } else {
                      return showMessageView();
                    }
                  },
                ),
              ],
            ),
          );
        } else if (state is InternetDisconnected) {
          return showMessageView(message: "No Internet Available");
        } else {
          return showMessageView();
        }
      }),
    );
  }
}
