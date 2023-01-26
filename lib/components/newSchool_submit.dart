import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shea/models/school.dart';
import 'package:shea/models/user/user.dart';

class NewSchoolForm extends HookConsumerWidget {
  const NewSchoolForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formTextController = useTextEditingController();
    final isFormDisabled = useState(formTextController.text.isEmpty);
    final user = ref.watch(userProvider);

    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: const Text(
              "Enter your schools's name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Material(
            color: const Color(0xffECECEC),
            child: TextFormField(
              controller: formTextController,
              autofocus: true,
              cursorColor: Colors.black,
              onChanged: (value) {
                isFormDisabled.value = value.isEmpty;
              },
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 110),
          Container(
            padding: const EdgeInsets.only(bottom: 40),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (isFormDisabled.value)
                  ? null
                  : () async {
                      Navigator.pop(context);
                      await SheaSchool.submitSchool(
                          formTextController.text, user);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBackgroundColor: Colors.grey,
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
