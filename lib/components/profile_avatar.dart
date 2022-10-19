import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/app.dart';
import 'package:shea/models/user/user.dart';

class SheaEditProfileAvatar extends HookConsumerWidget {
  final double? width;
  final double? height;
  final void Function()? onTap;

  const SheaEditProfileAvatar({
    super.key,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProvider).profile;
    final saveProfileImage = ref.read(userProvider.notifier).saveProfileImage;
    final hasImage = (profile.profileImageURL != null);
    final w = width ?? 24;
    final h = height ?? 24;
    final isSaving = useState(false);

    void onProfileTap() async {
      final file = await SheaApp.pickImage();
      if (file != null) {
        isSaving.value = true;
        await saveProfileImage(file);
        isSaving.value = false;
      }
    }

    return GestureDetector(
      onTap: onProfileTap,
      child: SizedBox(
        width: w,
        height: h,
        child: CircleAvatar(
          backgroundColor: const Color(0xffECECEC),
          maxRadius: 75,
          foregroundImage: (!isSaving.value && profile.profileImageURL != null)
              ? NetworkImage(profile.profileImageURL!)
              : null,
          child: (isSaving.value)
              ? const CircularProgressIndicator()
              : (!hasImage)
                  ? Center(child: Text(profile.name?.substring(0, 1) ?? "#"))
                  : null,
        ),
      ),
    );
  }
}
