import 'dart:math';

import 'package:demo/ui/home/home_page_state_notifier.dart';
import 'package:demo/ui/home/widgets/search_field.dart';
import 'package:demo/ui/home/widgets/track_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B212C),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              const Color(0xFF0145AC).withOpacity(.75),
              const Color(0xFF82C7A5).withOpacity(.75),
            ],
            transform: const GradientRotation(pi / 4.0),
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: constraints.maxWidth < 550
                        ? constraints.maxWidth
                        : (constraints.maxWidth * 0.85),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer(
                          builder: (_, WidgetRef ref, __) {
                            final state = ref.watch(homePageStateProvider);
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SearchField(),
                                const SizedBox(height: 12.0),
                                Expanded(
                                  child: CustomScrollView(
                                    slivers: [
                                      if (state.loadingState.failedToLoadResults)
                                        const SliverFillRemaining(
                                          child: Center(
                                            child: Text(
                                              'Sorry.. we failed to fetch results!',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 22.0,
                                              ),
                                            ),
                                          ),
                                        )
                                      else if (!state.hasQueriedAtLeastOnce)
                                        SliverFillRemaining(
                                          child: Center(
                                            child: Text(
                                              'Find the music you love!',
                                              style: Theme.of(context).textTheme.titleLarge,
                                            ),
                                          ),
                                        )
                                      else if (!state.loadingState.isLoadingResults &&
                                          state.query.isNotEmpty &&
                                          state.tracks.isEmpty)
                                        SliverToBoxAdapter(
                                          child: Text(
                                            'Your query has matched zero results!',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        )
                                      else
                                        SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                            (context, index) {
                                              if (index.isEven) {
                                                return const SizedBox(height: 8.0);
                                              }
                                              return ProviderScope(
                                                overrides: [
                                                  trackProvider
                                                      .overrideWithValue(state.tracks[index ~/ 2])
                                                ],
                                                child: const TrackWidget(),
                                              );
                                            },
                                            childCount: 2 * state.tracks.length,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
