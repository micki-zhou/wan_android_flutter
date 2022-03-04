/*
 * @Author: micki 
 * @Date: 2022-03-03 16:01:42 
 * @Last Modified by: micki
 * @Last Modified time: 2022-03-04 16:22:50
 * 文章列表页面
 */

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/http.dart';
import 'package:wan_android_flutter/bean/article_bean.dart';
import 'package:wan_android_flutter/config/my_colors.dart';

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
      backgroundColor: MyColors.commonPageGrayBg,
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

  // 文章列表ui
  Widget _articleList() {
    return FutureBuilder<List<ArticleData>?>(
        future: _getArticleListData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ArticleData>?> list) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.data == null ? 0 : list.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return _articleListItem(list.data!, index);
            },
          );
        });
  }

  // 文章列表item ui
  Widget _articleListItem(
    List<ArticleData> list,
    int index,
  ) {
    var data = list[index];

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            data.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  '作者: ' + data.author,
                  style: const TextStyle(fontSize: 12),
                ),
                // Text('分类: ' + data.superChapterName + '/' + data.chapterName,
                //     style: const TextStyle(fontSize: 12)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('时间: ' + data.niceDate,
                      style: const TextStyle(fontSize: 12)),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
