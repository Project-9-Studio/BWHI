import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/user/user.dart';

class SheaProfileAvatar extends HookConsumerWidget {
  final double? width;
  final double? height;
  const SheaProfileAvatar({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final hasImage = (profile.profileImageURL != null);
    final w = width ?? 24;
    final h = height ?? 24;

    return SizedBox(
      width: w,
      height: h,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: (hasImage)
            ? NetworkImage(profile.profileImageURL!, scale: 1)
            : null,
        child: (!hasImage)
            ? Center(child: Text(profile.name?.substring(0, 1) ?? "#"))
            : null,
      ),
    );
  }
}
