import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String) onSubmitted;
  final String placeholder;

  const AdaptativeTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: placeholder,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            decoration: InputDecoration(labelText: placeholder),
          );
  }
}
