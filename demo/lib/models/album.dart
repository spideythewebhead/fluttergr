import 'package:demo/models/cover_art_item.dart';

class Album {
  final String id;
  final String name;
  final CoverArt coverArt;
  final AlbumShareInfo sharingInfo;
}

class CoverArt {
  final List<CoverArtItem> sources;
}

class AlbumShareInfo {
  final Uri shareUrl;
}
