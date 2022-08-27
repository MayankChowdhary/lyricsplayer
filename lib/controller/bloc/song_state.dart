

part of 'song_bloc.dart';

@immutable
abstract class SongState extends Equatable {}

class SongLoadingState extends SongState {
  @override
  List<Object?> get props => [];
}

class SongLoadedState extends SongState {
  final SongModel song;

  SongLoadedState(this.song);

  @override
  List<Object?> get props => [song];
}

class SongErrorState extends SongState {
  final String error;

  SongErrorState(this.error);

  @override
  List<Object?> get props => [error];
}