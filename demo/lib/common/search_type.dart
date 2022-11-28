import 'package:data_class_plugin/data_class_plugin.dart';

enum SearchType {
  multi,
  tracks,
  users;

  /// Converts [SearchType] to a json value
  String toJson() => name;

  /// Returns a string with the properties of [SearchType]
  @override
  String toString() {
    String value = 'SearchType{<optimized out>}';
    assert(() {
      value = 'SearchType.$name@<$hexIdentity>{}';
      return true;
    }());
    return value;
  }
}
