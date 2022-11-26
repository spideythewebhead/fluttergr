import 'package:demo/models/artist.dart';
import 'package:demo/models/track.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackProvider = Provider<Track>((ref) => throw UnimplementedError());

extension on Duration {
  String get formatted {
    final minutes = (inMilliseconds ~/
            Duration.millisecondsPerSecond ~/
            Duration.secondsPerMinute)
        .toString()
        .padLeft(2, '0');
    final seconds = (inMilliseconds ~/
            Duration.millisecondsPerSecond %
            Duration.secondsPerMinute)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class TrackWidget extends ConsumerWidget {
  const TrackWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Track track = ref.watch(trackProvider);
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Material(
        type: MaterialType.canvas,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TrackImage(
                url: track.album.coverArt.sources[0].url,
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  track.name,
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                              const Text(' - '),
                              Text(
                                track.duration.formatted,
                                style: theme.textTheme.caption,
                              )
                            ],
                          ),
                          Text(
                            'Album: ${track.album.name}',
                            style: theme.textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Artists: '),
                        Flexible(
                          child: Wrap(
                            spacing: 4.0,
                            children: [
                              for (final Artist artist in track.artists.items)
                                Chip(
                                  label: Text(artist.profile.name),
                                  labelStyle: theme.textTheme.labelSmall,
                                  visualDensity: VisualDensity.compact,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TrackImage extends StatelessWidget {
  /// Shorthand constructor
  const _TrackImage({
    required this.url,
  });

  final Uri url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(
          url.toString(),
          cacheHeight: 128,
        ),
      ),
    );
  }
}
