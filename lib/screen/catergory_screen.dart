import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/category_provider.dart';
import '../widgets/news_tile.dart';

class CategoryScreen extends StatefulWidget {
  final String newsCategory;

  CategoryScreen({required this.newsCategory});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // var newslist;
  // bool _loading = true;

  // void getNews() async {
  //   NewsForCategorie news = NewsForCategorie();
  //   await news.getNewsForCategory(widget.newsCategory);
  //   newslist = news.news;
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  var _isloading = false;
  var _isInt = true;

  @override
  void didChangeDependencies() {
    if (_isInt) {
      setState(() {
        _isloading = true;
      });
      Provider.of<NewsForCategorie>(context)
          .getNewsForCategory(widget.newsCategory)
          .then((_) {
        setState(() {
          _isloading = false;
        });
      });
    }
    _isInt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Flash',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: Consumer<NewsForCategorie>(
                  builder: (context, newslist, child) => ListView.builder(
                      itemCount: newslist.news.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl: newslist.news[index].urlToImage,
                          title: newslist.news[index].title,
                          desc: newslist.news[index].description,
                          content: newslist.news[index].content,
                          posturl: newslist.news[index].articleUrl,
                        );
                      }),
                ),
              )),
            ),
    );
  }
}
