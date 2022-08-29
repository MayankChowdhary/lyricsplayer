

part of 'song_detail_bloc.dart';

@immutable
abstract class SongDetailState extends Equatable {}

class SongLoadingState extends SongDetailState {
  @override
  List<Object?> get props => [];
}

class SongLoadedState extends SongDetailState {
  final SongDetailModel song;

  SongLoadedState(this.song);

  @override
  List<Object?> get props => [song];
}

class SongErrorState extends SongDetailState {
  final String error;

  SongErrorState(this.error);

  @override
  List<Object?> get props => [error];
}