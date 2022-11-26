import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:data_class_plugin_fluttergr/models/album.dart';
import 'package:data_class_plugin_fluttergr/models/artist.dart';

typedef ListOfTracks = List<Track>;

@DataClass()
class Track {
  /// Shorthand constructor
  Track({
    required this.id,
    required this.name,
    required this.artists,
    required this.duration,
    required this.album,
  });

  final String id;
  final String name;
  final TrackArtists artists;

  @JsonKey(fromJson: _durationFromJson)
  final Duration duration;

  @JsonKey(name: 'albumOfTrack')
  final Album album;

  static Duration _durationFromJson(Map<dynamic, dynamic> json) {
    return Duration(milliseconds: json['duration']['totalMilliseconds'] as int);
  }

  /// Creates an instance of [Track] from [json]
  factory Track.fromJson(Map<dynamic, dynamic> json) {
    return Track(
      id: json['id'] as String,
      name: json['name'] as String,
      artists: TrackArtists.fromJson(json['artists']),
      duration: Track._durationFromJson(json),
      album: Album.fromJson(json['albumOfTrack']),
    );
  }

  /// Returns a string with the properties of [Track]
  @override
  String toString() {
    String value = 'Track{<optimized out>}';
    assert(() {
      value =
          'Track@<$hexIdentity>{id: $id, name: $name, artists: $artists, duration: $duration, album: $album}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      id,
      name,
      artists,
      duration,
      album,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Track &&
            id == other.id &&
            name == other.name &&
            artists == other.artists &&
            duration == other.duration &&
            album == other.album;
  }

  /// Converts [Track] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'artists': jsonConverterRegistrant.find(TrackArtists).toJson(artists),
      'duration': jsonConverterRegistrant.find(Duration).toJson(duration),
      'albumOfTrack': album.toJson(),
    };
  }
}

@DataClass()
class TrackArtists {
  /// Shorthand constructor
  TrackArtists({
    required this.items,
  });

  final List<Artist> items;

  /// Creates an instance of [TrackArtists] from [json]
  factory TrackArtists.fromJson(Map<dynamic, dynamic> json) {
    return TrackArtists(
      items: <Artist>[
        for (final dynamic i0 in (json['items'] as List<dynamic>)) Artist.fromJson(i0),
      ],
    );
  }

  /// Returns a string with the properties of [TrackArtists]
  @override
  String toString() {
    String value = 'TrackArtists{<optimized out>}';
    assert(() {
      value = 'TrackArtists@<$hexIdentity>{items: $items}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      items,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is TrackArtists && deepEquality(items, other.items);
  }
}
