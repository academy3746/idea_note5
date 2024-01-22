import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/common/widgets/score_indicator.dart';
import 'package:idea_note5/data/idea_info.dart';
import 'package:intl/intl.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.index,
    required this.ideaInfo,
  });

  final int index;

  final IdeaInfo ideaInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.size80,
      margin: const EdgeInsets.only(
        top: Sizes.size20,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(Sizes.size8),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// title
          Container(
            margin: const EdgeInsets.only(
              left: Sizes.size16,
              bottom: Sizes.size16,
            ),
            child: Text(
              '# ${ideaInfo.title}',
              style: const TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black,
              ),
            ),
          ),

          /// createdAt
          Container(
            margin: const EdgeInsets.only(
              right: Sizes.size16,
              bottom: Sizes.size8,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat('yyyy.MM.dd HH:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(ideaInfo.createdAt),
                ),
                style: TextStyle(
                  fontSize: Sizes.size10,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),

          /// importance
          Container(
            margin: const EdgeInsets.only(
              left: Sizes.size16,
              bottom: Sizes.size8,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ImportanceScore(ideaInfo: ideaInfo),
            ),
          ),
        ],
      ),
    );
  }
}
