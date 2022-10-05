import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../provider/article.dart';

class News with ChangeNotifier {
  List<Article> _news = [];

  List<Article> get news {
    return [..._news];
  }

  Future<void> getNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=[API_KEY]'
        );

    try {
      var response = await http.get(url);

      final jsonData = json.decode(response.body);
      //print(jsonData);
      final List<Article> loadedProduct = [];
      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              content: element['content'],
              //  publshedAt: DateTime.parse(element['publishedAt']),
              urlToImage: element['urlToImage'],
              articleUrl: element["url"],
            );
            // news.add(article);
            loadedProduct.add(article);
            _news = loadedProduct;
            notifyListeners();
          }
        });
      }
    } catch (error) {
      print(error);
    }
  }
}
