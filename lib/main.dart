import 'package:flutter/material.dart';
import 'package:news_app/provider/news.dart';
import 'package:provider/provider.dart';
import './screen/home_screen.dart';
import './provider/category.dart';
import '../provider/category_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String val;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Category()),
        ChangeNotifierProvider(create: (context) => News()),
        ChangeNotifierProvider(create: (context) => NewsForCategorie()),
      ],
      child: MaterialApp(
        title: 'News App',
        home: HomeScreen(),
      ),
    );
  }
}
