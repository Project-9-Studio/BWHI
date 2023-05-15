import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shea/models/app.dart';
import 'package:shea/models/school.dart';
import 'package:shea/screens/home/view_services.dart';
import 'package:url_launcher/url_launcher.dart';

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

    void openMap(String mapType) async {
      if (serviceCenter.addressUrl != null) {
        SheaApp.openUrl(Uri.parse(serviceCenter.addressUrl!));
        return;
      }

      if (serviceCenter.address != null) {
        SheaApp.displayAddress(
            address: serviceCenter.address!, mapType: mapType);
      }
    }

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
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.only(bottom: 6),
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
              margin: const EdgeInsets.only(bottom: 4),
              child: const Divider(color: Colors.black),
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
            SheaViewServices(serviceCenter: serviceCenter),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (serviceCenter.phone != null) {
                          final Uri launchUri = Uri(
                            scheme: 'tel',
                            path: serviceCenter.phone,
                          );
                          if (await canLaunchUrl(launchUri)) {
                            await launchUrl(launchUri);
                          }
                        }
                      },
                      style: actionStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 7),
                            child: const HeroIcon(
                              HeroIcons.phone,
                              color: Colors.black,
                              style: HeroIconStyle.solid,
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
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () => openMap("apple"),
                                isDefaultAction: true,
                                child: const Text("Open in Maps"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () => openMap("google"),
                                isDefaultAction: true,
                                child: const Text("Open in Google Maps"),
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                          ),
                        );
                      },
                      style: actionStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 7),
                            child: const HeroIcon(
                              HeroIcons.map,
                              color: Colors.black,
                              style: HeroIconStyle.solid,
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
              onPressed: () async {
                if (serviceCenter.website != null) {
                  await launchUrl(Uri.parse(serviceCenter.website!));
                }
              },
              style: actionStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 7),
                    child: const HeroIcon(
                      HeroIcons.globeAlt,
                      color: Colors.black,
                      style: HeroIconStyle.solid,
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
