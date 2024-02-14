import 'package:android_lyrics_player/data/models/song_model.dart';
import 'package:android_lyrics_player/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/song_details_model.dart';

class SongDetailsRepository {


  Future<SongDetailModel> getSongDetails(String trackId) async {
     final queryParameters = {'apikey': Strings.apiKeyMusixMatch};
    debugPrint("DetailsAPI: "+trackId);
    queryParameters.putIfAbsent('track_id', () => trackId);
    Uri uri = Uri.parse(Strings.songDetailUrl)
        .replace(queryParameters: queryParameters);
    debugPrint(uri.toString() +"id: "+queryParameters['track_id']!);
    debugPrint("track_id: "+queryParameters['track_id']!);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return songDetailModelFromJson(response.body);
    } else {
      debugPrint("Failed to load Song Details");
      throw Exception("Failed to load songs Details");
    }
  }
}
