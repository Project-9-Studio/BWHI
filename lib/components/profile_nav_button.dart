import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/user/user.dart';

class SheaProfileNavButton extends HookConsumerWidget {
  const SheaProfileNavButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final hasImage = (profile.profileImageURL != null);

    return SizedBox(
      width: 24,
      height: 24,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: (hasImage)
            ? ResizeImage(
                NetworkImage(profile.profileImageURL!),
                width: 48,
                height: 48,
              )
            : null,
        child: (!hasImage)
            ? Center(child: Text(profile.name?.substring(0, 1) ?? "#"))
            : null,
      ),
    );
  }
}
