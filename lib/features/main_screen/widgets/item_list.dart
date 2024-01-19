import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/features/main_screen/widgets/score_indicator.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.index,
  });

  final int index;

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
          /// Title
          Container(
            margin: const EdgeInsets.only(
              left: Sizes.size16,
              bottom: Sizes.size16,
            ),
            child: const Text(
              '# 해병 짜장을 만들어 보아요!',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black,
              ),
            ),
          ),

          /// CreatedAt
          Container(
            margin: const EdgeInsets.only(
              right: Sizes.size16,
              bottom: Sizes.size8,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '2024.01.19 14:00:00',
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
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: ImportanceScore(),
            ),
          ),
        ],
      ),
    );
  }
}
