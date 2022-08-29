import 'dart:async';

import 'package:android_lyrics_player/data/repositories/song_lyrics_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/models/song_lyrics_model.dart';


part 'song_lyrics_event.dart';

part 'song_lyrics_state.dart';

class SongLyricsBloc extends Bloc<SongLyricsEvent, SongLyricsState> {
  final SongLyricsRepository _songRepository;

  SongLyricsBloc(this._songRepository) : super(SongLoadingState()) {
    on<LoadSongLyricsEvent>((event, emit) async {
      emit(SongLoadingState());
      try {
        debugPrint("Fetching Song Lyrics...");
        final song = await _songRepository.getSongLyrics(event.trackId);
        emit(SongLoadedState(song));
      } catch (e) {
        debugPrint("Printing Error: $e");
        emit(SongErrorState(e.toString()));
      }
    });
  }
}
