part of 'song_lyrics_bloc.dart';

@immutable
abstract class SongLyricsEvent extends Equatable {
  final String trackId;
  const SongLyricsEvent(this.trackId);
}

class LoadSongLyricsEvent extends SongLyricsEvent {
  const LoadSongLyricsEvent(super.trackId);

  @override
  List<Object> get props => [];
}
