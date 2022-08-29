

part of 'song_lyrics_bloc.dart';

@immutable
abstract class SongLyricsState extends Equatable {}

class SongLoadingState extends SongLyricsState {
  @override
  List<Object?> get props => [];
}

class SongLoadedState extends SongLyricsState {
  final SongLyricsModel song;

  SongLoadedState(this.song);

  @override
  List<Object?> get props => [song];
}

class SongErrorState extends SongLyricsState {
  final String error;

  SongErrorState(this.error);

  @override
  List<Object?> get props => [error];
}