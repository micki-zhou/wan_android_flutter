/*
 * @Author: micki 
 * @Date: 2022-03-02 11:14:01 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-02 18:26:22
 * 登录页面
 */

import 'dart:collection';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/http.dart';
import 'package:wan_android_flutter/config/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 账号输入框控制器
  var accountTextContriller = TextEditingController();
  // 密码输入框控制器
  var passwordTextController = TextEditingController();
  var accountErrorText = '';
  var passwordErrorText = '';

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

// 账号输入框
  Widget _accountInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: accountTextContriller,
        style: const TextStyle(fontSize: 15),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: MyColors.white,
            hintText: '账号',
            errorText: accountErrorText,
            filled: true,
            isCollapsed: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none)),
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              accountErrorText = '';
            });
          } else {
            setState(() {
              accountErrorText = '账号不能为空';
            });
          }
        },
      ),
    );
  }

// 密码输入框
  Widget _passwordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: TextField(
        controller: passwordTextController,
        style: const TextStyle(fontSize: 15),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            fillColor: MyColors.white,
            hintText: '密码',
            errorText: passwordErrorText,
            filled: true,
            isCollapsed: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none)),
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              passwordErrorText = '';
            });
          } else {
            setState(() {
              passwordErrorText = '密码不能为空';
            });
          }
        },
      ),
    );
  }

// 登录按钮
  Widget _loginBtn() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: TextButton(
        onPressed: () async {
          if (accountTextContriller.text.isEmpty) {
            setState(() {
              accountErrorText = '账号不能为空';
            });
            return;
          }
          if (passwordTextController.text.isEmpty) {
            setState(() {
              passwordErrorText = '密码不能为空';
            });
            return;
          }
          var map = HashMap<String,dynamic>();
          map['username'] = accountTextContriller.text;
          map['password'] = passwordTextController.text;
          var result =
              await Http.post('user/login', '登录', data: map);
          // log(result.data['data']['id'].toString());  

        },
        child: const Text('登录'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.btnBgColor),
            foregroundColor: MaterialStateProperty.all(MyColors.white)),
      ),
    );
  }
}

Widget toast(String msg) {
  return Tooltip(
    message: msg,
    height: 60,
  );
}
