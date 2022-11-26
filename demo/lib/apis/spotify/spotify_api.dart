import 'dart:convert';

import 'package:demo/apis/spotify/models/search_request.dart';
import 'package:demo/apis/spotify/models/search_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

abstract class SpotifyApi {
  SpotifyApi();

  factory SpotifyApi.asset() = AssetSpotifyApi;
  factory SpotifyApi.http() = HttpSpotifyApi;

  Future<SearchResponse> query(SearchRequest request);
}

class AssetSpotifyApi implements SpotifyApi {
  @override
  Future<SearchResponse> query(SearchRequest request) async {
    await Future.delayed(const Duration(seconds: 2));
    final json = await rootBundle
        .loadString('assets/spotify-search-response.json')
        .then((value) => jsonDecode(value));
    return SearchResponse.fromJson(json);
  }
}

class HttpSpotifyApi implements SpotifyApi {
  final http.Client _client = http.Client();

  @override
  Future<SearchResponse> query(SearchRequest request) async {
    final response = await _client.get(
      Uri.https(
        'spotify23.p.rapidapi.com',
        '/search/',
        request.toJson().map((key, value) => MapEntry(key, '$value')),
      ),
      headers: {
        'X-RapidAPI-Key': '789a64a589msh81aadeef3038479p1d77c4jsn1c6e2942bddd',
        'X-RapidAPI-Host': 'spotify23.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      return SearchResponse.fromJson(json);
    }

    throw HttpException(response);
  }
}

class HttpException implements Exception {
  HttpException(this.response);

  final http.Response response;
}
