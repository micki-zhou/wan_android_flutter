/*
 * @Author: micki 
 * @Date: 2022-03-03 16:01:42 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-03 18:18:24
 * 文章列表页面
 */

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/http.dart';
import 'package:wan_android_flutter/bean/article_bean.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _articleList(),
    );
  }

// 获取文章列表数据
  Future<List<ArticleData>?> _getArticleListData() async {
    var result = await Http.get('article/list/0/json', '文章列表');
    if (result.data['errorCode'] == 0) {
      var article = Article.fromJson(result.data['data']);
      var list = article.datas?.map((data) {
        return ArticleData.fromJson(data);
      }).toList();
      return list;
    }
    return null;
  }

  Widget _articleList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return _articleListItem(index);
      },
    );
  }

  /// todo 转载数据
  Widget _articleListItem(
    int index,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Column(children: [Text('121212')]),
    );
  }
}
