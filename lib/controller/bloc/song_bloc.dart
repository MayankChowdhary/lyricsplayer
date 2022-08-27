import 'dart:async';

import 'package:android_lyrics_player/data/repositories/song_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/models/song_model.dart';

part 'song_event.dart';

part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository _songRepository;

  SongBloc(this._songRepository) : super(SongLoadingState()) {
    on<LoadSongEvent>((event, emit) async {
      emit(SongLoadingState());
      try {
        debugPrint("Decoding Received Objects");
        final song = await _songRepository.getSongs();
        emit(SongLoadedState(song));
      } catch (e) {
        debugPrint("Printing Error: $e");
        emit(SongErrorState(e.toString()));
      }
    });
  }
}
