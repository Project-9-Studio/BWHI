import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shea/models/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class SheaResourceLink extends StatelessWidget {
  final SheaResource? resource;
  const SheaResourceLink({super.key, this.resource});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (resource?.url != null) {
          await launchUrl(Uri.parse(resource!.url!));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                resource?.name ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const HeroIcon(
              HeroIcons.chevronRight,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
