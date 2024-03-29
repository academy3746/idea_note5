import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    required this.btnText,
    this.margin,
  });

  final String btnText;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).primaryColor;

    return Container(
      margin: margin,
      decoration: ShapeDecoration(
        color: themeColor,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: themeColor,
          ),
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
      ),
      height: Sizes.size64,
      alignment: Alignment.center,
      child: Text(
        btnText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
