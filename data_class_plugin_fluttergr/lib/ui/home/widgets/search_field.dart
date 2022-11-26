import 'package:data_class_plugin_fluttergr/ui/home/home_page_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      homePageStateProvider
          .select((value) => value.loadingState.isLoadingResults),
    );
    final homePageStateNotifier = ref.watch(homePageStateProvider.notifier);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: kElevationToShadow[1],
        color: Theme.of(context).cardColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Search your favourite tracks...',
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onChanged: homePageStateNotifier.search,
              ),
              if (isLoading) const LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
