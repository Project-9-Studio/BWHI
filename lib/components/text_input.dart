import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SheaTextInput extends HookConsumerWidget {
  final EdgeInsetsGeometry? margin;
  final String? label;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? initialValue;
  final bool? enabled;

  const SheaTextInput({
    super.key,
    this.margin,
    this.label,
    this.keyboardType,
    this.onChanged,
    this.initialValue,
    this.enabled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isEnabled = enabled != null && enabled!;
    const labelBorderColor = Color.fromARGB(140, 0, 0, 0);
    final textController = useTextEditingController(text: initialValue);
    textController.selection = TextSelection.collapsed(
      offset: textController.text.length,
    );

    textController.addListener(() {
      if (onChanged != null && textController.text != initialValue) {
        onChanged!(textController.value.text);
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            label ?? "",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: labelBorderColor,
            ),
          ),
        ),
        TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: textController,
          enabled: enabled,
          style: const TextStyle(fontSize: 22, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 17,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusColor: Colors.red,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
