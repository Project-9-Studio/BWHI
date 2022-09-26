import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class SheaFastFact {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;

  const SheaFastFact({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
  });

  static fromJson(Map<String, dynamic> data) {
    return SheaFastFact(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      imageUrl: data["imageUrl"],
    );
  }
}

class SheaFastFactState {
  final List<String> ids;
  final Map<String, SheaFastFact> entities;

  const SheaFastFactState({this.ids = const [], this.entities = const {}});

  SheaFastFact? getFact(String id) {
    return entities[id];
  }
}

class SheaFastFactsNotifier extends StateNotifier<SheaFastFactState> {
  SheaFastFactsNotifier() : super(const SheaFastFactState());

  Future<SheaFastFactState> fetchFacts() async {
    final db = FirebaseFirestore.instance;
    final collection = await db.collection("fastfacts").get();
    final facts = List<SheaFastFact>.from(
      collection.docs.map(
        (e) => SheaFastFact.fromJson(e.data()),
      ),
    );

    if (facts.isNotEmpty) {
      state = SheaFastFactState(
        ids: List<String>.from(facts.map((e) => e.id ?? "")),
        entities:
            Map<String, SheaFastFact>.fromIterable(facts, key: (e) => e.id),
      );
    }

    return state;
  }
}

final fastFactsProvider =
    StateNotifierProvider<SheaFastFactsNotifier, SheaFastFactState>((ref) {
  return SheaFastFactsNotifier();
});
