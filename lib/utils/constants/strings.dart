class Strings {
  // App
  static const appTitle = 'Lyrics Player';

  // HomeScreen
  static const homeScreenTitle = 'Trending Songs';
  static const homeScreenCenterText = 'Lyrics Player';
  static const apiKeyMusixMatch = "8fb62ae61c46e2c9bc48b96bb2c216f5";
  static const String baseUrl = "https://api.musixmatch.com/ws/1.1/";
  static const String songListUrl = "${baseUrl}chart.tracks.get";
  static const String songDetailUrl = "${baseUrl}track.get?track_id=TRACK_ID&apikey=$apiKeyMusixMatch";
  static const String songLyricsUrl = "${baseUrl}track.lyrics.get?track_id=TRACK_ID&apikey=$apiKeyMusixMatch";




}
