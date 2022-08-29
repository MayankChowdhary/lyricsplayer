import 'package:android_lyrics_player/data/models/song_model.dart';
import 'package:android_lyrics_player/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SongRepository {
  final queryParameters = {
    'apikey': Strings.apiKeyMusixMatch,
    'chart_name': 'top',
    'page': '1',
    'page_size': '50',
    'country': 'IN',
    'f_has_lyrics': '1'
  };

  Future<SongModel> getSongs() async {
    Uri uri = Uri.parse(Strings.songListUrl)
        .replace(queryParameters: queryParameters);
    debugPrint(uri.toString());
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return songModelFromJson(response.body);
    } else {
      debugPrint("Failed to load Songs");
      throw Exception("Failed to load songs");
    }
  }
}
