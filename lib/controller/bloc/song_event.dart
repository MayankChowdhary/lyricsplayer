part of 'song_bloc.dart';

@immutable
abstract class SongEvent extends Equatable {
  const SongEvent();
}

class LoadSongEvent extends SongEvent {
  @override
  List<Object> get props => [];
}
