import 'package:flutter/material.dart';
import 'package:news_app/screen/article_view_screen.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {required this.imgUrl,
      required this.title,
      required this.desc,
      required this.content,
      required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleViewScreen(
                      posturl: posturl,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(6),
                bottomLeft: Radius.circular(6)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  imgUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                title,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                desc,
                maxLines: 2,
                style: TextStyle(color: Colors.black54, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
