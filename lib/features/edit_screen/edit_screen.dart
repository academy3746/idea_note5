import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/gaps.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/common/widgets/app_snackbar.dart';
import 'package:idea_note5/common/widgets/confirm_button.dart';
import 'package:idea_note5/data/db_helper.dart';
import 'package:idea_note5/data/idea_info.dart';
import 'package:idea_note5/features/edit_screen/widgets/score_selector.dart';
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
  /// Initialize Database Helper Instance
  final dbHelper = DatabaseHelper();

  /// 입력필드 Controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motiveController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  /// 아이디어 중요도 점수 Bool 초기화
  bool clicked01 = false;
  bool clicked02 = false;
  bool clicked03 = true;
  bool clicked04 = false;
  bool clicked05 = false;

  /// 아이디어 중요도 점수 Integer 초기화
  int score = 3;

  /// 아이디어 중요도 점수 Bool 초기화
  void _initClickedStatus() {
    clicked01 = false;
    clicked02 = false;
    clicked03 = false;
    clicked04 = false;
    clicked05 = false;
  }

  /// Soft Keyboard 비활성화
  void _keyboardUnfocus() {
    FocusScope.of(context).unfocus();
  }

  /// INSERT Database
  Future<void> _insertIdeaInfo(IdeaInfo data) async {
    await dbHelper.initDatabase();

    await dbHelper.insertIdeaInfo(data);
  }

  @override
  Widget build(BuildContext context) {
    var snackBar = AppSnackbar(context: context);

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
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _initClickedStatus();

                        setState(() {
                          score = 1;
                          clicked01 = true;
                        });
                      },
                      child: ScoreSelector(
                        score: 1,
                        clicked: clicked01,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickedStatus();

                        setState(() {
                          score = 2;
                          clicked02 = true;
                        });
                      },
                      child: ScoreSelector(
                        score: 2,
                        clicked: clicked02,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickedStatus();

                        setState(() {
                          score = 3;
                          clicked03 = true;
                        });
                      },
                      child: ScoreSelector(
                        score: 3,
                        clicked: clicked03,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickedStatus();

                        setState(() {
                          score = 4;
                          clicked04 = true;
                        });
                      },
                      child: ScoreSelector(
                        score: 4,
                        clicked: clicked04,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _initClickedStatus();

                        setState(() {
                          score = 5;
                          clicked05 = true;
                        });
                      },
                      child: ScoreSelector(
                        score: 5,
                        clicked: clicked05,
                      ),
                    ),
                  ],
                ),
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

                /// 작성완료 Button
                GestureDetector(
                  onTap: () async {
                    var titleValue = _titleController.text.toString();
                    var motiveValue = _motiveController.text.toString();
                    var contentValue = _contentController.text.toString();
                    var feedbackValue = _feedbackController.text.toString();

                    /// Validation
                    if (titleValue.isEmpty ||
                        motiveValue.isEmpty ||
                        contentValue.isEmpty) {
                      snackBar.showSnackbar(context);

                      return;
                    }

                    /// DB CREATE
                    if (widget.ideaInfo == null) {
                      var now = DateTime.now().millisecondsSinceEpoch;

                      var data = IdeaInfo(
                        title: titleValue,
                        motive: motiveValue,
                        content: contentValue,
                        importance: score,
                        feedback: feedbackValue.isNotEmpty ? feedbackValue : '',
                        createdAt: now,
                      );

                      await _insertIdeaInfo(data);

                      if (!mounted) return;
                      Navigator.pop(context);
                    }
                  },
                  child: const ConfirmButton(btnText: '작성완료'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
