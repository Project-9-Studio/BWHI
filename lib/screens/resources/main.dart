import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/resources.dart';
import 'package:shea/screens/resources/resource.dart';

class SheaResourcesView extends HookConsumerWidget {
  const SheaResourcesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resourceState = ref.watch(resourcesProvider);
    final resourceIds = resourceState.ids.where((element) {
      return (resourceState.active != null)
          ? resourceState.entities[element]?.topic == resourceState.active
          : true;
    }).toList();
    final resourceTopics = resourceState.getTopics();
    final getResource = ref.read(resourcesProvider).getResource;
    final fetchResources = ref.read(resourcesProvider.notifier).fetchResources;
    final setActiveFilter =
        ref.read(resourcesProvider.notifier).setActiveFilter;

    useEffect(() {
      fetchResources();
      return null;
    }, []);

    return (resourceIds.isNotEmpty)
        ? Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: resourceTopics.length,
                  itemBuilder: ((context, index) {
                    final topic = resourceTopics[index];
                    final isActive =
                        resourceTopics[index] == resourceState.active;

                    return GestureDetector(
                      onTap: () {
                        final activeIndex = (isActive) ? null : topic;
                        setActiveFilter(activeIndex);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 18,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: (isActive)
                              ? const Color(0xffFFC41C)
                              : Colors.black,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          topic,
                          style: TextStyle(
                            color: (isActive) ? Colors.black : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: resourceIds.length,
                    itemBuilder: ((context, index) {
                      final resource = getResource(resourceIds[index]);
                      return SheaResourceLink(resource: resource);
                    }),
                  ),
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
