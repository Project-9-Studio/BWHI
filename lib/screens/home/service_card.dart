import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shea/models/school.dart';

class SheaSchoolServicesCard extends StatelessWidget {
  final String schoolName;
  final SheaServiceCenter serviceCenter;

  const SheaSchoolServicesCard({
    Key? key,
    this.schoolName = "",
    this.serviceCenter = const SheaServiceCenter(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xffFFC41C),
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 1,
    );
    const actionTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.black,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                schoolName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4, bottom: 12),
              padding: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xff9E9C8A)),
                ),
              ),
              child: Text(
                serviceCenter.name ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff9E9C8A),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 170,
              child: Text(
                serviceCenter.address ?? "",
                style: const TextStyle(
                  color: Color(0xff9E9C8A),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              serviceCenter.hours ?? "",
              style: const TextStyle(
                color: Color(0xff9E9C8A),
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 20,
                  ),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  children: const [
                    Text(
                      "View Services",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    HeroIcon(
                      HeroIcons.arrowNarrowRight,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: actionStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 7),
                            child: const HeroIcon(
                              HeroIcons.phone,
                              solid: true,
                              color: Colors.black,
                            ),
                          ),
                          const Text("Call", style: actionTextStyle),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 186,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: actionStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 7),
                            child: const HeroIcon(
                              HeroIcons.map,
                              solid: true,
                              color: Colors.black,
                            ),
                          ),
                          const Text("Directions", style: actionTextStyle)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: actionStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 7),
                    child: const HeroIcon(
                      HeroIcons.globeAlt,
                      solid: true,
                      color: Colors.black,
                    ),
                  ),
                  const Text("View Website", style: actionTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
