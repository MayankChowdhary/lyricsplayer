import 'package:android_lyrics_player/core/themes/app_theme.dart';
import 'package:android_lyrics_player/ui/widgets/loading_widget.dart';
import 'package:android_lyrics_player/ui/screens/home_screen/song_list_view.dart';
import 'package:android_lyrics_player/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/bloc/song_list_bloc/song_list_bloc.dart' as slb;
import '../../../controller/cubit/internet_cubit/internet_cubit.dart';
import '../../widgets/dipslay_snackbar.dart';
import '../../widgets/message_view.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = Strings.homeScreenRoute;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<slb.SongBloc>(context).add(slb.LoadSongListEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.primaryLight,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Strings.userInfoRoute);
        },
        child: const Image(image: AssetImage("assets/user.png"))
      ),
      body:
          BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
        if (state is InternetConnected) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<slb.SongBloc, slb.SongListState>(
                  builder: (context, state) {
                    if (state is slb.SongLoadingState) {
                      return loadingWidget();
                    } else if (state is slb.SongLoadedState) {
                      return SongListView(state.song);
                    } else if (state is slb.SongErrorState) {
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
