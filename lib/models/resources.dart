import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class SheaResource {
  final String? id;
  final String? name;
  final String? url;
  final String? topic;

  const SheaResource({
    this.id,
    this.name,
    this.url,
    this.topic,
  });

  static fromJson(Map<String, dynamic> data) {
    return SheaResource(
      id: data["id"],
      name: data["name"],
      url: data["url"],
      topic: data["topic"],
    );
  }
}

class SheaResourcesState {
  final List<String> ids;
  final Map<String, SheaResource> entities;
  final String? active;

  const SheaResourcesState({
    this.ids = const [],
    this.entities = const {},
    this.active,
  });

  SheaResource? getResource(String id) {
    return entities[id];
  }

  List<String> getTopics() {
    final topics =
        ids.map((id) => getResource(id)?.topic ?? "").toSet().toList();
    topics.sort();
    return topics;
  }
}

class SheaResourcesNotifier extends StateNotifier<SheaResourcesState> {
  SheaResourcesNotifier() : super(const SheaResourcesState());

  Future<SheaResourcesState> fetchResources() async {
    final db = FirebaseFirestore.instance;
    final collection = await db.collection("resources").get();
    final resources = List<SheaResource>.from(
      collection.docs.map(
        (e) => SheaResource.fromJson(e.data()),
      ),
    );

    if (resources.isNotEmpty) {
      state = SheaResourcesState(
        ids: List<String>.from(resources.map((e) => e.id ?? "")),
        entities:
            Map<String, SheaResource>.fromIterable(resources, key: (e) => e.id),
      );
    }

    return state;
  }

  SheaResourcesState setActiveFilter(String? filterId) {
    state = SheaResourcesState(
      ids: state.ids,
      entities: state.entities,
      active: filterId,
    );
    return state;
  }
}

final resourcesProvider =
    StateNotifierProvider<SheaResourcesNotifier, SheaResourcesState>((ref) {
  return SheaResourcesNotifier();
});
