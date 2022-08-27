import 'package:android_lyrics_player/controller/bloc/song_bloc.dart';
import 'package:android_lyrics_player/ui/widgets/error_message_view.dart';
import 'package:android_lyrics_player/ui/widgets/loading_widget.dart';
import 'package:android_lyrics_player/ui/widgets/song_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SongBloc>(context).add(LoadSongEvent());
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
                BlocBuilder<SongBloc, SongState>(
                  builder: (context, state) {
                    if (state is SongLoadingState) {
                      return loadingWidget();
                    } else if (state is SongLoadedState) {
                      return songListView(context, state.song);
                    } else if (state is SongErrorState) {
                      return showErrorView();
                    } else {
                      return showErrorView();
                    }
                  },
                ),
              ],
            ),
          );
        } else if (state is InternetDisconnected) {
          return showErrorView(message: "No Internet Available");
        } else {
          return showErrorView();
        }
      }),
    );
  }
}
