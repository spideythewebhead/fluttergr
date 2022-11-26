import 'package:data_class_plugin_fluttergr/providers/spotify_api_provider.dart';
import 'package:data_class_plugin_fluttergr/repos/songs_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songsRepoProvider = Provider((ref) {
  return SongsRepo(spotifyApi: ref.read(spotifyApiProvider));
});
