import 'package:demo/apis/spotify/models/search_request.dart';
import 'package:demo/apis/spotify/models/search_response.dart';
import 'package:demo/apis/spotify/spotify_api.dart';
import 'package:demo/models/track.dart';
import 'package:demo/repos/repo_result.dart';

class SongsRepo {
  SongsRepo({
    required SpotifyApi spotifyApi,
  }) : _spotifyApi = spotifyApi;

  final SpotifyApi _spotifyApi;

  Future<RepoResult<ListOfTracks>> searchForTracks(String query) async {
    try {
      final response = await _spotifyApi.query(SearchRequest(query: query));
      final items = response.tracks?.items ?? const <DataWrapper<Track>>[];

      return RepoResult.data(
        data: [
          for (DataWrapper<Track> wrapper in items) wrapper.data,
        ],
      );
    } catch (e, stackTrace) {
      return RepoResult.error(
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
