class Article {
  var curPage;
  List<dynamic>? datas = null;
  var pageCount;
  var size;

  Article.fromJson(dynamic map) {
    this.curPage = map['curPage'];
    this.datas = map['datas'];
    this.pageCount = map['pageCount'];
    this.size = map['size'];
  }
}

class ArticleData {
  var title;
  var collect;
  var superChapterName;
  var chapterName;
  var shareUser;
  var author;

  ArticleData.fromJson(Map<String, dynamic> map) {
    this.title = map['title'];
    this.collect = map['collect'];
    this.superChapterName = map['superChapterName'];
    this.chapterName = map['chapterName'];
    this.shareUser = map['shareUser'];
    this.author = map['author'];
  }
}
