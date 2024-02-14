import 'package:android_lyrics_player/data/models/song_lyrics_model.dart';
import 'package:android_lyrics_player/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SongLyricsRepository {


  Future<SongLyricsModel> getSongLyrics(String trackId) async {
     final   queryParameters = {'apikey': Strings.apiKeyMusixMatch};
    queryParameters.putIfAbsent('track_id', () => trackId);
    Uri uri = Uri.parse(Strings.songLyricsUrl)
        .replace(queryParameters: queryParameters);
    debugPrint(uri.toString());
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return songLyricsModelFromJson(response.body);
    } else {
      debugPrint("Failed to load Song Details");
      throw Exception("Failed to load songs Details");
    }
  }
}
