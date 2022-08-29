part of 'song_detail_bloc.dart';

@immutable
abstract class SongDetailEvent extends Equatable {
   final String trackId;
   const SongDetailEvent(this.trackId);
}

class LoadSongDetailEvent extends SongDetailEvent {
  const LoadSongDetailEvent(super.trackId);
  @override
  List<Object> get props => [];
}
