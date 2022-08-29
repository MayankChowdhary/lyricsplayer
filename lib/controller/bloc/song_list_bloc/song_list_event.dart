part of 'song_list_bloc.dart';

@immutable
abstract class SongListEvent extends Equatable {
  const SongListEvent();
}

class LoadSongListEvent extends SongListEvent {
  @override
  List<Object> get props => [];
}
