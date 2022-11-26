import 'package:data_class_plugin/data_class_plugin.dart';

@DataClass()
class CoverArtItem {
  /// Shorthand constructor
  CoverArtItem({
    required this.url,
    required this.width,
    required this.height,
  });

  final Uri url;
  final int width;
  final int height;

  /// Creates an instance of [CoverArtItem] from [json]
  factory CoverArtItem.fromJson(Map<dynamic, dynamic> json) {
    return CoverArtItem(
      url: jsonConverterRegistrant.find(Uri).fromJson(json['url']) as Uri,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }

  /// Returns a string with the properties of [CoverArtItem]
  @override
  String toString() {
    String value = 'CoverArtItem{<optimized out>}';
    assert(() {
      value = 'CoverArtItem@<$hexIdentity>{url: $url, width: $width, height: $height}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      url,
      width,
      height,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CoverArtItem && url == other.url && width == other.width && height == other.height;
  }

  /// Converts [CoverArtItem] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': jsonConverterRegistrant.find(Uri).toJson(url),
      'width': width,
      'height': height,
    };
  }
}
