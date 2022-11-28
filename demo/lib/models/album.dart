import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:demo/models/cover_art_item.dart';

@DataClass()
class Album {
  /// Shorthand constructor
  Album({
    required this.id,
    required this.name,
    required this.coverArt,
    required this.sharingInfo,
  });

  final String id;
  final String name;
  final CoverArt coverArt;
  final AlbumShareInfo sharingInfo;

  /// Returns a string with the properties of [Album]
  @override
  String toString() {
    String value = 'Album{<optimized out>}';
    assert(() {
      value =
          'Album@<$hexIdentity>{id: $id, name: $name, coverArt: $coverArt, sharingInfo: $sharingInfo}';
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
      coverArt,
      sharingInfo,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Album &&
            id == other.id &&
            name == other.name &&
            coverArt == other.coverArt &&
            sharingInfo == other.sharingInfo;
  }

  /// Creates an instance of [Album] from [json]
  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(
      id: json['id'] as String,
      name: json['name'] as String,
      coverArt: CoverArt.fromJson(json['coverArt']),
      sharingInfo: AlbumShareInfo.fromJson(json['sharingInfo']),
    );
  }
}

@DataClass()
class CoverArt {
  /// Shorthand constructor
  CoverArt({
    required this.sources,
  });

  final List<CoverArtItem> sources;

  /// Returns a string with the properties of [CoverArt]
  @override
  String toString() {
    String value = 'CoverArt{<optimized out>}';
    assert(() {
      value = 'CoverArt@<$hexIdentity>{sources: $sources}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      sources,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is CoverArt && deepEquality(sources, other.sources);
  }

  /// Creates an instance of [CoverArt] from [json]
  factory CoverArt.fromJson(Map<dynamic, dynamic> json) {
    return CoverArt(
      sources: <CoverArtItem>[
        for (final dynamic i0 in (json['sources'] as List<dynamic>)) CoverArtItem.fromJson(i0),
      ],
    );
  }
}

@DataClass()
class AlbumShareInfo {
  /// Shorthand constructor
  AlbumShareInfo({
    required this.shareUrl,
  });

  final Uri shareUrl;

  /// Returns a string with the properties of [AlbumShareInfo]
  @override
  String toString() {
    String value = 'AlbumShareInfo{<optimized out>}';
    assert(() {
      value = 'AlbumShareInfo@<$hexIdentity>{shareUrl: $shareUrl}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      shareUrl,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is AlbumShareInfo && shareUrl == other.shareUrl;
  }

  /// Creates an instance of [AlbumShareInfo] from [json]
  factory AlbumShareInfo.fromJson(Map<dynamic, dynamic> json) {
    return AlbumShareInfo(
      shareUrl: jsonConverterRegistrant.find(Uri).fromJson(json['shareUrl']) as Uri,
    );
  }
}
