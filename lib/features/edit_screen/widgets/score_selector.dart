import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';

class ScoreSelector extends StatelessWidget {
  const ScoreSelector({
    super.key,
    required this.score,
    required this.clicked,
  });

  final int score;

  final bool clicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: clicked ? Theme.of(context).primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: clicked ? Theme.of(context).primaryColor : Colors.black,
          ),
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: Sizes.size10),
      height: Sizes.size40,
      width: Sizes.size50,
      child: Text(
        '$score',
        style: TextStyle(
          color: clicked ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
