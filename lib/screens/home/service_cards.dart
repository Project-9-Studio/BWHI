import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/school.dart';
import 'package:shea/screens/home/service_card.dart';

class SheaSchoolServicesCards extends HookConsumerWidget {
  final SheaSchool school;

  const SheaSchoolServicesCards({Key? key, this.school = const SheaSchool()})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    final services = school.listServiceCenters();

    return (school.services.isNotEmpty)
        ? SizedBox(
            width: double.infinity,
            height: 522,
            child: Swiper(
              itemBuilder: (context, index) {
                final serviceCenter = services[index]!;
                return SheaSchoolServicesCard(
                  serviceCenter: serviceCenter,
                  schoolName: school.name ?? "",
                );
              },
              itemCount: services.length,
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(activeColor: Colors.white),
              ),
            ),
          )
        : Container();
  }
}
