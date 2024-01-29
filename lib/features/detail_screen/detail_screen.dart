import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/common/widgets/delete_button.dart';
import 'package:idea_note5/data/db_helper.dart';
import 'package:idea_note5/data/idea_info.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    this.ideaInfo,
  });

  static const String routeName = '/detail';

  final IdeaInfo? ideaInfo;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  /// Initialize Database Helper Instance
  final _dbHelper = DatabaseHelper();

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
          widget.ideaInfo!.title,
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.black,
          ),
        ),
        actions: [
          DeleteButton(
            ideaInfo: widget.ideaInfo,
            dbHelper: _dbHelper,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
