import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/components/reminder_modal.dart';
import 'package:shea/firebase_options.dart';
import 'package:shea/models/user/user.dart';

class SheaAppLanding extends HookConsumerWidget {
  const SheaAppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveAuth = ref.read(userProvider.notifier).setAuth;
    final fetchProfile = ref.read(userProvider.notifier).fetchProfile;
    final saveToken = ref.read(userProvider.notifier).saveFCMToken;

    Future<void> handleMessage(RemoteMessage message) async {
      if (message.data["type"] == "reminder") {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40.0),
            ),
          ),
          builder: (BuildContext context) => SheaReminderModal(
            imageUrl: message.data["imageUrl"],
            title: message.data["title"],
            body: message.data["body"],
          ),
        );
      }
    }

    Future<void> initApp() async {
      WidgetsFlutterBinding.ensureInitialized();

      // Init firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Init phone_number region
      await init();

      // Request notification permission
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      // Get any messages which caused the application to open from
      // a terminated state.
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();

      if (initialMessage != null) {
        handleMessage(initialMessage);
      }

      // Also handle any interaction when the app is in the background via a
      // Stream listener
      FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
      FirebaseMessaging.onMessage.listen(handleMessage);
      FirebaseMessaging.onBackgroundMessage(handleMessage);

      // Check for auth
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null) {
          saveAuth(SheaUser(user: user));
          final result = await fetchProfile();
          final path =
              (result.profile.id != null) ? "home" : "createAccount/name";

          await saveToken(await FirebaseMessaging.instance.getToken());

          await FirebaseMessaging.instance.subscribeToTopic("affirmation");
          await FirebaseMessaging.instance.subscribeToTopic("reminder");

          if (context.mounted) {
            Navigator.popAndPushNamed(context, path);
            return;
          }
        }

        if (context.mounted) Navigator.popAndPushNamed(context, "onboard");
      });
    }

    useEffect(() {
      initApp();
      return;
    });

    return const Center(child: CircularProgressIndicator());
  }
}
