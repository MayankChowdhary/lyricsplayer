

part of 'song_list_bloc.dart';

@immutable
abstract class SongListState extends Equatable {}

class SongLoadingState extends SongListState {
  @override
  List<Object?> get props => [];
}

class SongLoadedState extends SongListState {
  final SongModel song;

  SongLoadedState(this.song);

  @override
  List<Object?> get props => [song];
}

class SongErrorState extends SongListState {
  final String error;

  SongErrorState(this.error);

  @override
  List<Object?> get props => [error];
}