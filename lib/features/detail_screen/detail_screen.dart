import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/data/idea_info.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    this.ideaInfo,
  });

  static const String routeName = '/detail';

  final IdeaInfo? ideaInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: Sizes.size24,
            color: Colors.black,
          ),
        ),
        title: Text(
          ideaInfo!.title,
          style: const TextStyle(
            fontSize: Sizes.size18,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
