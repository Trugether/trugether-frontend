import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PageManager {
  late final String url;
  late AudioPlayer _audioPlayer;

  // Constructor that accepts url as a parameter
  PageManager({required this.url}) {
    _init();
  }

  // Initialize the audio player
  void _init() async {
    print("Initiated");
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url); // Set the url after initialization

    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else if (processingState == ProcessingState.completed) {
        buttonNotifier.value = ButtonState.completed;
      } else {
        buttonNotifier.value = ButtonState.loading;
      }
    });

    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void replay() {
    _audioPlayer.seek(Duration.zero);
    _audioPlayer.play();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  // ProgressNotifier to update progress
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  // Button state notifier to update play/pause buttons
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.playing);
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading, completed }
