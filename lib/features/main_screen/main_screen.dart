// ignore_for_file: deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:idea_note5/common/constants/sizes.dart';
import 'package:idea_note5/common/widgets/back_handler_button.dart';
import 'package:idea_note5/common/widgets/item_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  /// 뒤로가기 App 종료 (Android 한정)
  BackHandlerButton? backHandlerButton;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    backHandlerButton = BackHandlerButton(context: context);
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return ItemList(index: index);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
          onPressed: () {},
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
