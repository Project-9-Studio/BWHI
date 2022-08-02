import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/firebase_options.dart';

class SheaApp extends HookConsumerWidget {
  const SheaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(true);
    final home = (isLoading.value)
        ? const Center(child: CircularProgressIndicator())
        : null;

    void _init() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      isLoading.value = false;
    }

    useEffect(() {
      _init();
      return;
    });

    return MaterialApp(
      title: "Shea",
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
      ),
      home: home,
    );
  }
}
