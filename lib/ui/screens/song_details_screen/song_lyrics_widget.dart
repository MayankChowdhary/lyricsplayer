import 'package:android_lyrics_player/data/models/song_lyrics_model.dart';
import 'package:flutter/material.dart';

import '../../../data/models/song_details_model.dart';

class SongLyricsView extends StatelessWidget {
  const SongLyricsView(this.model, {super.key});

  final SongLyricsModel? model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "${model?.message?.body?.lyrics?.lyricsBody}",
          overflow: TextOverflow.visible,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
