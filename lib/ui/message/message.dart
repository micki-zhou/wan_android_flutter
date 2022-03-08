/*
 * @Author: micki 
 * @Date: 2022-03-03 16:00:43 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-03 16:30:09
 * 消息中心
 */
import 'package:flutter/material.dart';

import '../../api/http.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('消息'),
    );
  }

  Future<void> getMessage() async {
    var result = await Http.get('message/lg/unread_list/1/json', '消息列表');
  }
}
