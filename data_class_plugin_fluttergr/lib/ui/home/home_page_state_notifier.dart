import 'dart:async';

import 'package:data_class_plugin_fluttergr/providers/songs_repo_provider.dart';
import 'package:data_class_plugin_fluttergr/repos/songs_repo.dart';
import 'package:data_class_plugin_fluttergr/ui/home/home_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageStateProvider = StateNotifierProvider //
    .autoDispose<HomePageStateNotifier, HomePageState>(
  (ref) {
    return HomePageStateNotifier(
      songsRepo: ref.read(songsRepoProvider),
    );
  },
);

class HomePageStateNotifier extends StateNotifier<HomePageState> {
  HomePageStateNotifier({
    required SongsRepo songsRepo,
  })  : _songsRepo = songsRepo,
        super(const HomePageState());

  final SongsRepo _songsRepo;

  final DebounceTimer _searchDebouncer =
      DebounceTimer(const Duration(milliseconds: 500));

  void search(String query) {
    _searchDebouncer.run(() async {
      state = state.copyWith(
        hasQueriedAtLeastOnce: true,
        loadingState: const LoadingState(
          isLoadingResults: true,
          failedToLoadResults: false,
        ),
      );

      final result = await _songsRepo.searchForTracks(query);

      state = result.when<HomePageState>(
        data: (data) {
          return state.copyWith(
            loadingState: const LoadingState(isLoadingResults: false),
            tracks: data.data,
          );
        },
        error: (error) {
          return state.copyWith(
            loadingState: const LoadingState(failedToLoadResults: true),
          );
        },
      );
    });
  }
}

class DebounceTimer {
  DebounceTimer(this._debounceTime);

  final Duration _debounceTime;
  Timer? _timer;

  void run(void Function() execute) {
    _timer?.cancel();
    _timer = Timer(_debounceTime, execute);
  }
}
