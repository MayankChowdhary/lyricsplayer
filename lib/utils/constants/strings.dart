class Strings {
  // App
  static const appTitle = 'Lyrics Player';

  //router constants
  static const String homeScreenRoute = '/';
  static const String songDetailsRoute = '/songDetails';
  static const String userInfoRoute = '/userInfo';

  // HomeScreen
  static const homeScreenTitle = 'Lyrics Player 🎼';
  static const detailsScreenTitle = 'Track Details';
  static const homeScreenCenterText = 'Lyrics Player';
  //static const apiKeyMusixMatch = "8fb62ae61c46e2c9bc48b96bb2c216f5";
  static const apiKeyMusixMatch = "93b62ae61c46e2c9bc48b96bb2c216k6";
  static const String baseUrl = "https://api.musixmatch.com/ws/1.1/";
  static const String songListUrl = "${baseUrl}chart.tracks.get";
  static const String songDetailUrl = "${baseUrl}track.get";
  static const String songLyricsUrl = "${baseUrl}track.lyrics.get";

  static const String iconGifUrl = "https://i.pinimg.com/originals/17/72/f1/1772f18a9f99aeb4a56d047960f272a1.gif";
  static const String iconPlayUrl = "https://i.pinimg.com/originals/00/74/e3/0074e333fc2b2e9d6120a0c826306f5a.gif";




}
