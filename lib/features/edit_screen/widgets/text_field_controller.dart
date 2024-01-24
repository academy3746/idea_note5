import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.editingController,
    this.fieldHeight,
    required this.vertical,
    required this.horizontal,
    required this.hintText,
    this.maxLines,
    this.maxLength,
    this.action,
  });

  final TextEditingController editingController;

  final double? fieldHeight;

  final double vertical;

  final double horizontal;

  final String hintText;

  final int? maxLines;

  final int? maxLength;

  final TextInputAction? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fieldHeight,
      margin: const EdgeInsets.only(top: Sizes.size10),
      child: TextField(
        textInputAction: action,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          contentPadding: EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
        ),
        style: const TextStyle(
          fontSize: Sizes.size12,
          color: Colors.black,
        ),
        controller: editingController,
      ),
    );
  }
}
