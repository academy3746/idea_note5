import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/data/idea_info.dart';

class ImportanceScore extends StatelessWidget {
  const ImportanceScore({
    super.key,
    required this.ideaInfo,
  });

  final IdeaInfo ideaInfo;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      updateOnDrag: false,
      initialRating: ideaInfo.importance.toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      itemSize: Sizes.size16,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, index) {
        return FaIcon(
          FontAwesomeIcons.star,
          color: Theme.of(context).primaryColor,
        );
      },
      onRatingUpdate: (double value) {},
    );
  }
}