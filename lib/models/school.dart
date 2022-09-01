// Shea Schools
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class SheaSchool {
  final String? id;
  final String? name;
  final String? address;
  final Map<String, SheaServiceCenter> services;

  const SheaSchool(
      {this.id, this.name, this.address, this.services = const {}});

  static SheaSchool fromJson(Map<String, dynamic> data) {
    return SheaSchool(
      id: data["id"],
      name: data["name"],
      address: data["address"],
      services: data["services"] ?? {},
    );
  }

  SheaSchool copyWith(SheaSchool school) {
    return SheaSchool(
        id: school.id ?? id,
        name: school.name ?? name,
        address: school.address ?? address,
        services: {
          ...services,
          ...school.services,
        });
  }

  List<SheaServiceCenter> listServiceCenters() {
    return List.from(services.values);
  }
}

@immutable
class SheaServiceCenter {
  final String? id;
  final String? name;
  final String? address;
  final String? addressUrl;
  final String? phone;
  final String? type;
  final String? hours;
  final String? website;
  final String? crisisPhone;
  final String? mainPhone;
  final String? textPhone;
  final List<String>? physicalServices;
  final List<String>? reproductiveSrvices;
  final List<String>? mentalServices;

  const SheaServiceCenter({
    this.id,
    this.address,
    this.addressUrl,
    this.crisisPhone,
    this.hours,
    this.mainPhone,
    this.mentalServices,
    this.name,
    this.phone,
    this.physicalServices,
    this.reproductiveSrvices,
    this.textPhone,
    this.type,
    this.website,
  });

  static SheaServiceCenter fromJson(Map<String, dynamic> data) {
    return SheaServiceCenter(
      id: data["id"],
      name: data["name"],
      address: data["address"],
      addressUrl: data["addressUrl"],
      crisisPhone: data["crisisPhone"],
      hours: data["hours"],
      mainPhone: data["mainPhone"],
      mentalServices: data["mentalServices"],
      phone: data["phone"],
      physicalServices: data["physicalServices"],
      reproductiveSrvices: data["reproductiveSrvices"],
      textPhone: data["textPhone"],
      type: data["type"],
      website: data["website"],
    );
  }

  SheaServiceCenter copyWith(SheaServiceCenter serviceCenter) {
    return SheaServiceCenter(
      id: serviceCenter.id ?? id,
      name: serviceCenter.name ?? name,
      address: serviceCenter.address ?? address,
      addressUrl: serviceCenter.addressUrl ?? addressUrl,
      crisisPhone: serviceCenter.crisisPhone ?? crisisPhone,
      hours: serviceCenter.hours ?? hours,
      mainPhone: serviceCenter.mainPhone ?? mainPhone,
      mentalServices: serviceCenter.mentalServices ?? mentalServices,
      phone: serviceCenter.phone ?? phone,
      physicalServices: serviceCenter.physicalServices ?? physicalServices,
      reproductiveSrvices:
          serviceCenter.reproductiveSrvices ?? reproductiveSrvices,
      textPhone: serviceCenter.textPhone ?? textPhone,
      type: serviceCenter.type ?? type,
      website: serviceCenter.website ?? website,
    );
  }
}

@immutable
class SheaSchoolState {
  final List<String> ids;
  final Map<String, SheaSchool> entities;

  const SheaSchoolState({this.ids = const [], this.entities = const {}});

  SheaSchool? getSchool(String id) {
    return entities[id];
  }

  Map<String, SheaSchool> getSchoolsByName() {
    return {for (var id in ids) entities[id]!.name!: entities[id]!};
  }

  SheaSchool? getSchoolByName({String? name = ""}) {
    return getSchoolsByName()[name];
  }

  SheaSchool? getSchoolById({String id = ""}) {
    return entities[id];
  }

  SheaSchoolState copyWith(SheaSchoolState state) {
    return SheaSchoolState(
      ids: [...ids, ...state.ids],
      entities: {...entities, ...state.entities},
    );
  }
}

class SheaSchoolNotifier extends StateNotifier<SheaSchoolState> {
  SheaSchoolNotifier() : super(const SheaSchoolState());

  Future<SheaSchoolState> fetchSchools() async {
    final db = FirebaseFirestore.instance;
    final collection = await db.collection("schools").get();
    final schools = List<SheaSchool>.from(
      collection.docs.map(
        (e) => SheaSchool.fromJson(e.data()),
      ),
    );

    state = SheaSchoolState(
      ids: List<String>.from(schools.map((e) => e.id ?? "")),
      entities: Map<String, SheaSchool>.fromIterable(schools, key: (e) => e.id),
    );

    return state;
  }

  Future<SheaSchoolState> fetchSchoolServices(String id) async {
    final db = FirebaseFirestore.instance;
    final collection = await db.collectionGroup("serviceCenters").get();
    final services = List<SheaServiceCenter>.from(
      collection.docs.map(
        (e) => SheaServiceCenter.fromJson(e.data()),
      ),
    );
    final school = state.getSchoolById(id: id);

    if (school != null) {
      state = state.copyWith(SheaSchoolState(entities: {
        id: school!.copyWith(
          SheaSchool(
            services: Map<String, SheaServiceCenter>.fromIterable(
              services,
              key: (e) => e.id,
            ),
          ),
        )
      }));
    }

    return state;
  }
}

final schoolsProvider =
    StateNotifierProvider<SheaSchoolNotifier, SheaSchoolState>((ref) {
  return SheaSchoolNotifier();
});
