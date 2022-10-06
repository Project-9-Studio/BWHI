import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/fastfacts.dart';
import 'package:shea/screens/fast_facts/card.dart';

class SheaFastFactsView extends HookConsumerWidget {
  const SheaFastFactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factIds = ref.watch(fastFactsProvider).ids;
    final getFact = ref.read(fastFactsProvider).getFact;
    final fetchFacts = ref.read(fastFactsProvider.notifier).fetchFacts;

    useEffect(() {
      fetchFacts();
      return null;
    }, []);

    return (factIds.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 34),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: factIds.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: ((context, index) {
                final fact = getFact(factIds[index]);
                return SheaFastFactCard(fact: fact);
              }),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
