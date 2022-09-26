import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/fastfacts.dart';
import 'package:shea/models/resources.dart';
import 'package:shea/screens/fast_facts/card.dart';
import 'package:shea/screens/resources/resource.dart';

class SheaResourcesView extends HookConsumerWidget {
  const SheaResourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resourceIds = ref.watch(resourcesProvider).ids;
    final getResource = ref.read(resourcesProvider).getResource;
    final fetchResources = ref.read(resourcesProvider.notifier).fetchResources;

    useEffect(() {
      fetchResources();
      return null;
    }, []);

    return (resourceIds.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: resourceIds.length,
              itemBuilder: ((context, index) {
                final resource = getResource(resourceIds[index]);
                return SheaResourceLink(resource: resource);
              }),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
