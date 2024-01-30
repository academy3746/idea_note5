import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/gaps.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/common/widgets/confirm_button.dart';
import 'package:idea_note5/common/widgets/delete_button.dart';
import 'package:idea_note5/common/widgets/score_indicator.dart';
import 'package:idea_note5/data/db_helper.dart';
import 'package:idea_note5/data/idea_info.dart';
import 'package:idea_note5/features/edit_screen/edit_screen.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.all(Sizes.size20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// motive
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size16,
                        bottom: Sizes.size10,
                      ),
                      child: const Text(
                        '아이디어를 떠올린 계기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      widget.ideaInfo!.motive,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                    Gaps.v16,

                    /// content
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size16,
                        bottom: Sizes.size10,
                      ),
                      child: const Text(
                        '아이디어 내용',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      widget.ideaInfo!.content,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                    Gaps.v16,

                    /// importance
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size16,
                        bottom: Sizes.size10,
                      ),
                      child: const Text(
                        '아이디어 중요도 점수',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ImportanceScore(
                      ideaInfo: widget.ideaInfo!,
                      itemSize: Sizes.size36,
                    ),
                    Gaps.v16,

                    /// feedback
                    Container(
                      margin: const EdgeInsets.only(
                        top: Sizes.size16,
                        bottom: Sizes.size10,
                      ),
                      child: const Text(
                        '유저 피드백',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      widget.ideaInfo!.feedback!,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// IdeaInfo UPDATE
          GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(
                context,
                EditScreen.routeName,
                arguments: widget.ideaInfo,
              );
            },
            child: const ConfirmButton(
              margin: EdgeInsets.all(Sizes.size20),
              btnText: '수정하기',
            ),
          ),
        ],
      ),
    );
  }
}
