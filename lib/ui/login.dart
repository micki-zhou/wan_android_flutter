/*
 * @Author: micki 
 * @Date: 2022-03-02 11:14:01 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-02 12:46:46
 * 登录页面
 */

import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/dio_config.dart';
import 'package:wan_android_flutter/config/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.theme,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_accountInput(), _passwordInput(), _loginBtn()],
      ),
    );
  }
}

// 账号输入框
Widget _accountInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: TextField(
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
          fillColor: MyColors.white,
          hintText: '账号',
          filled: true,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none)),
    ),
  );
}

// 密码输入框
Widget _passwordInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: TextField(
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
          fillColor: MyColors.white,
          hintText: '密码',
          filled: true,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none)),
    ),
  );
}

// 登录按钮
Widget _loginBtn() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: TextButton(
        onPressed: () {
          get('wxarticle/chapters/json','登录');
        },
        child: const Text('登录'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.btnBgColor),
            foregroundColor: MaterialStateProperty.all(MyColors.white)),
      ),

  );
}
