// ignore_for_file: deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/common/widgets/back_handler_button.dart';
import 'package:idea_note5/data/db_helper.dart';
import 'package:idea_note5/data/idea_info.dart';
import 'package:idea_note5/features/edit_screen/edit_screen.dart';
import 'package:idea_note5/features/main_screen/widgets/item_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  /// 뒤로가기 App 종료 (Android 한정)
  BackHandlerButton? backHandlerButton;

  /// DB 객체 배열 형태로 초기화
  List<IdeaInfo> lstIdeaInfo = [];

  /// Database CRUD 기능 수행
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    backHandlerButton = BackHandlerButton(context: context);

    //insertDummyData();
    _getIdeaInfo();
  }

  /// Only For Debugging
  Future<void> insertDummyData() async {
    var now = DateTime.now().millisecondsSinceEpoch;

    var dummyInfo = IdeaInfo(
      title: '맛있는 해병 짜장을 만들어 볼까요?',
      motive: '해병 짜장이 너무 좋아!',
      content: '기열찐빠들이나 할만한 발상이군!',
      importance: 4,
      feedback: '야, 이 똥게이 새끼들아!',
      createdAt: now,
    );

    await dbHelper.initDatabase();

    await dbHelper.insertIdeaInfo(dummyInfo);
  }

  /// SELECT * FROM `tb_idea` WHERE (1) ORDER BY createdAt DESC
  Future<void> _getIdeaInfo() async {
    await dbHelper.initDatabase();

    lstIdeaInfo = await dbHelper.selectIdeaInfo();

    lstIdeaInfo.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      print('앱이 포그라운드에서 실행중입니다.');
    } else {
      print('앱이 백그라운드에서 실행중입니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var bgColor = Theme.of(context).primaryColor.withOpacity(0.7);

    return WillPopScope(
      onWillPop: () async {
        if (backHandlerButton != null) {
          return backHandlerButton!.onWillPop();
        }

        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'IDEA NOTE',
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(Sizes.size20),
          child: ListView.builder(
            itemCount: lstIdeaInfo.length,
            itemBuilder: (context, index) {
              return ItemList(
                index: index,
                ideaInfo: lstIdeaInfo[index],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: bgColor,
          onPressed: () {
            Navigator.pushNamed(
              context,
              EditScreen.routeName,
            );
          },
          child: Image.asset(
            'assets/images/post.png',
            width: Sizes.size32,
            height: Sizes.size32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
