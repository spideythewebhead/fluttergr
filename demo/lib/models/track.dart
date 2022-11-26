import 'package:demo/models/album.dart';
import 'package:demo/models/artist.dart';

typedef ListOfTracks = List<Track>;

class Track {
  final String id;
  final String name;
  final TrackArtists artists;
  final Duration duration;
  final Album album;
}

class TrackArtists {
  final List<Artist> items;
}
