import 'package:flutter/material.dart';
import 'package:news_app/provider/category.dart';
import 'package:news_app/provider/news.dart';
import 'package:provider/provider.dart';
import '../widgets/category_item.dart';
import '../widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isloading = false;
  var _isInt = true;

  @override
  void didChangeDependencies() {
    if (_isInt) {
      setState(() {
        _isloading = true;
      });
      Provider.of<News>(context).getNews().then((_) {
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
        backgroundColor: Colors.teal,
        elevation: 0.0,
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: Consumer<Category>(
                        builder: (context, value, child) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.category.length,
                          itemBuilder: ((context, index) => CategoryCard(
                              imageAssertUrl: value.category[index].imageAsset,
                              categoryName:
                                  value.category[index].categoryName)),
                        ),
                      ),
                    ),
                    NewWidget()
                  ],
                ),
              ),
            ),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<News>(context);

    if (newsList.news.isEmpty) {
      return Center(
        child: AlertDialog(
          title: const Text("An error occurred"),
          content: const Text("Something went wrong."),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: newsList.news.length,
            itemBuilder: ((context, index) {
              return NewsTile(
                  imgUrl: newsList.news[index].urlToImage,
                  title: newsList.news[index].title,
                  desc: newsList.news[index].description,
                  content: newsList.news[index].content,
                  posturl: newsList.news[index].articleUrl);
            })),
      );
    }
  }
}
