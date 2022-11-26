import 'package:demo/common/search_type.dart';

class SearchRequest {
  final String query;
  final SearchType type;
  final int offset;
  final int limit;
  final int numberOfTopResults;
}
