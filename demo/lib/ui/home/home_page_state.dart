import 'package:demo/models/track.dart';

class HomePageState {
  final String query;
  final LoadingState loadingState;
  final ListOfTracks tracks;
  final bool hasQueriedAtLeastOnce;
}

class LoadingState {
  final bool isLoadingResults;
  final bool failedToLoadResults;
}
