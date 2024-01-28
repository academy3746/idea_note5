import 'package:flutter/material.dart';

class AppSnackbar {
  final BuildContext context;

  AppSnackbar({required this.context});

  void showSnackbar(BuildContext context) {
    var snackBar = const SnackBar(
      content: Text('비어있는 내용을 작성해 주세요!'),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
