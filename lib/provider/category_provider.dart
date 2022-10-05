import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../provider/article.dart';

class NewsForCategorie with ChangeNotifier {
  List<Article> _news = [];

  List<Article> get news {
    return [..._news];
  }

  Future<void> getNewsForCategory(String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=[API_KEY]");

    var response = await http.get(url);
    print(url);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    final List<Article> loadedProduct = [];

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          loadedProduct.add(article);
          _news = loadedProduct;
        }
      });
    }
  }
}
