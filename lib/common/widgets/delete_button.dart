import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/data/db_helper.dart';
import 'package:idea_note5/data/idea_info.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    this.ideaInfo,
    required this.dbHelper,
  });

  final IdeaInfo? ideaInfo;

  final DatabaseHelper dbHelper;

  /// 게시물 삭제
  Future<void> _deleteIdeaInfo(int id) async {
    await dbHelper.initDatabase();

    await dbHelper.deleteIdeaInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('정말 삭제 하시겠어요?'),
              content: const Text('삭제된 게시물은 다시 복구할 수 없습니다.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '취소',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await _deleteIdeaInfo(ideaInfo!.id!);

                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                    Navigator.pop(context, 'delete');
                  },
                  child: const Text(
                    '확인',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Text(
        '삭제',
        style: TextStyle(
          fontSize: Sizes.size16,
          color: Colors.red,
        ),
      ),
    );
  }
}
