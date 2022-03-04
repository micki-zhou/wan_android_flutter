/*
 * @Author: micki 
 * @Date: 2022-03-03 15:56:23 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-03 16:32:29
 * 首页
 */
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/ui/article/article.dart';
import 'package:wan_android_flutter/ui/message/message.dart';
import 'package:wan_android_flutter/ui/mine/mine.dart';

import '../../config/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [const ArticlePage(), const MessagePage(), const MinePage()];
  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/test_home.png',
          width: 30,
          height: 30,
        ),
        label: '文章',
        activeIcon: Image.asset(
          'images/test_home.png',
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/test_home.png',
          width: 30,
          height: 30,
        ),
        label: '消息',
        activeIcon: Image.asset(
          'images/test_home.png',
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/test_home.png',
          width: 30,
          height: 30,
        ),
        label: '我的',
        activeIcon: Image.asset(
          'images/test_home.png',
          width: 30,
          height: 30,
        ))
  ];
  int bottomIndex = 0; // bottom navigation index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: bottomIndex,
        selectedItemColor: MyColors.theme,
        unselectedItemColor: MyColors.commonBlackTextColor,
        onTap: (index) {
          changePage(index);
        },
      ),
      // body: pages[bottomIndex],
      body: IndexedStack(
        index: bottomIndex,
        children: pages,
      ),
    );
  }

  void changePage(int index) {
    if (index != bottomIndex) {
      setState(() {
        bottomIndex = index;
      });
    }
  }
}
