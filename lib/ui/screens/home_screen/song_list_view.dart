import 'package:android_lyrics_player/core/themes/app_theme.dart';
import 'package:android_lyrics_player/data/models/song_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/strings.dart';
import '../../../utils/constants/ScreenArguments.dart';

class SongListView extends StatelessWidget {
  const SongListView(this.model, {super.key});

  final SongModel? model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model?.message?.body?.trackList?.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  Strings.songDetailsRoute,
                  arguments: ScreenArguments(model
                      ?.message?.body?.trackList![index].track?.trackId
                      ?.toString()),
                )
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        height: 50,
                        width: 50,
                        imageUrl:  Strings.iconGifUrl,
                        placeholder: (context, url) => new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/album_art.png', height: 50, width: 50,),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Track: ${model?.message?.body?.trackList![index].track?.trackName}",
                                    overflow: TextOverflow.ellipsis, style: TextStyle(color: AppTheme.primaryLight, fontSize: 16),
                                  )),
                              SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Album: ${model?.message?.body?.trackList![index].track?.albumName}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 2.0),
                        width: 100.0,
                        child: Text(
                            "Artist: ${model?.message?.body?.trackList![index].track?.artistName}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
