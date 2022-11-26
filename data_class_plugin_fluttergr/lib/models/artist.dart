import 'package:data_class_plugin/data_class_plugin.dart';

@DataClass()
class Artist {
  /// Shorthand constructor
  Artist({
    required this.profile,
  });

  final ArtistProfile profile;

  /// Returns a string with the properties of [Artist]
  @override
  String toString() {
    String value = 'Artist{<optimized out>}';
    assert(() {
      value = 'Artist@<$hexIdentity>{profile: $profile}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      profile,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Artist && profile == other.profile;
  }

  /// Converts [Artist] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'profile': profile.toJson(),
    };
  }

  /// Creates an instance of [Artist] from [json]
  factory Artist.fromJson(Map<dynamic, dynamic> json) {
    return Artist(
      profile: ArtistProfile.fromJson(json['profile']),
    );
  }
}

@DataClass()
class ArtistProfile {
  /// Shorthand constructor
  ArtistProfile({
    required this.name,
  });

  final String name;

  /// Returns a string with the properties of [ArtistProfile]
  @override
  String toString() {
    String value = 'ArtistProfile{<optimized out>}';
    assert(() {
      value = 'ArtistProfile@<$hexIdentity>{name: $name}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      name,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is ArtistProfile && name == other.name;
  }

  /// Converts [ArtistProfile] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
    };
  }

  /// Creates an instance of [ArtistProfile] from [json]
  factory ArtistProfile.fromJson(Map<dynamic, dynamic> json) {
    return ArtistProfile(
      name: json['name'] as String,
    );
  }
}
