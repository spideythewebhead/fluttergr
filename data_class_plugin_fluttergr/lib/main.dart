import 'package:data_class_plugin_fluttergr/apis/spotify/spotify_api.dart';
import 'package:data_class_plugin_fluttergr/providers/spotify_api_provider.dart';
import 'package:data_class_plugin_fluttergr/register_json_types.dart';
import 'package:data_class_plugin_fluttergr/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  registerJsonTypes();

  runApp(ProviderScope(
    overrides: [
      spotifyApiProvider.overrideWithValue(SpotifyApi.asset()),
      // spotifyApiProvider.overrideWithValue(SpotifyApi.http()),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
