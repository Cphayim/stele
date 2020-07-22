/*
 * @Author: Cphayim
 * @Date: 2020-07-10 00:58:24
 * @LastEditTime: 2020-07-10 15:18:50
 * @Description: 搜索
 */

class SearchModel {
  final List<SearchItem> data;
  String keyword;

  SearchModel({this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    List list = json['data'] as List;
    List<SearchItem> data = list.map((i) => SearchItem.fromJson(i)).toList();
    return SearchModel(data: data);
  }
}

class SearchItem {
  final String word;
  final String type;
  final String price;
  final String star;
  final String zonename;
  final String disrictname;
  final String url;

  SearchItem(
      {this.word,
      this.type,
      this.price,
      this.star,
      this.zonename,
      this.disrictname,
      this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      word: json['word'],
      type: json['type'],
      price: json['price'],
      star: json['star'],
      zonename: json['zonename'],
      disrictname: json['disrictname'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'type': type,
      'price': price,
      'star': star,
      'zonename': zonename,
      'disrictname': disrictname,
      'url': url,
    };
  }
}
