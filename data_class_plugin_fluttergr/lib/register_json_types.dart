import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:data_class_plugin_fluttergr/models/track.dart';

class TrackJsonConverter implements JsonConverter<Track, Map<String, dynamic>> {
  @override
  Track fromJson(Map<String, dynamic> value) => Track.fromJson(value);

  @override
  Map<String, dynamic> toJson(Track value) => throw UnimplementedError();
}

void registerJsonTypes() {
  jsonConverterRegistrant.register(TrackJsonConverter());
}
