import 'dart:async';

import 'package:android_lyrics_player/data/repositories/song_details_repository.dart';
import 'package:android_lyrics_player/data/repositories/song_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/models/song_details_model.dart';


part 'song_details_event.dart';

part 'song_details_state.dart';

class SongDetailsBloc extends Bloc<SongDetailEvent, SongDetailState> {
  final SongDetailsRepository _songRepository;

  SongDetailsBloc(this._songRepository) : super(SongLoadingState()) {
    on<LoadSongDetailEvent>((event, emit) async {
      emit(SongLoadingState());
      try {
        debugPrint("Fetching Song Details...");
        final song = await _songRepository.getSongDetails(event.trackId);
        emit(SongLoadedState(song));
      } catch (e) {
        debugPrint("Printing Error: $e");
        emit(SongErrorState(e.toString()));
      }
    });
  }
}
