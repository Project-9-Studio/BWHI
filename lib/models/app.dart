import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class SheaApp {
  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static void displayAddress({
    required String address,
    String mapType = "google",
  }) async {
    final url = (mapType == "google")
        ? Uri(
            scheme: "https",
            host: "www.google.com",
            path: "/maps/search/",
            queryParameters: {"api": "1", "query": address},
          )
        : Uri(
            scheme: "https",
            host: "maps.apple.com",
            queryParameters: {"address": address},
          );
    openUrl(url);
  }

  static void openUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      try {
        launchUrl(url);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
