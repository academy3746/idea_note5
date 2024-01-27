import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/gaps.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/data/idea_info.dart';
import 'package:idea_note5/features/edit_screen/widgets/text_field_controller.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    this.ideaInfo,
  });

  static const String routeName = "/edit";

  final IdeaInfo? ideaInfo;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  /// 입력필드 Controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motiveController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  /// Soft Keyboard 비활성화
  void _keyboardUnfocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '새 아이디어 작성하기',
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size18,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: Sizes.size24,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _keyboardUnfocus,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            margin: const EdgeInsets.all(Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                const Text('제목'),
                InputField(
                  editingController: _titleController,
                  fieldHeight: Sizes.size40,
                  vertical: 0,
                  horizontal: Sizes.size16,
                  hintText: '아이디어 제목',
                  action: TextInputAction.next,
                ),
                Gaps.v16,

                /// motive
                const Text('아이디어를 떠올린 계기'),
                InputField(
                  editingController: _motiveController,
                  fieldHeight: Sizes.size40,
                  vertical: 0,
                  horizontal: Sizes.size16,
                  hintText: '아이디어를 떠올린 계기',
                  action: TextInputAction.next,
                ),
                Gaps.v16,

                /// content
                const Text('아이디어 내용'),
                InputField(
                  editingController: _contentController,
                  vertical: Sizes.size20,
                  horizontal: Sizes.size16,
                  hintText: '떠오른 아이디어를 자세히 작성해 주세요.',
                  maxLines: 5,
                  maxLength: 1000,
                ),
                Gaps.v16,

                /// importance
                const Text('아이디어 중요도 점수'),

                Gaps.v16,

                /// feedback
                const Text('유저 피드백 사항 (선택)'),
                InputField(
                  editingController: _feedbackController,
                  vertical: Sizes.size20,
                  horizontal: Sizes.size16,
                  hintText: '떠오른 아이디어를 기반으로\n전달받은 피드백을 정리해 주세요.',
                  maxLines: 5,
                  maxLength: 500,
                ),
                Gaps.v16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
