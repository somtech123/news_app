import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatergoryModel {
  String imageAsset;
  String categoryName;
  CatergoryModel({required this.imageAsset, required this.categoryName});
}

class Category with ChangeNotifier {
  final List<CatergoryModel> _list = [
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
        categoryName: "business"),
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
        categoryName: "Entertainment"),
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
        categoryName: "General"),
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80",
        categoryName: "Health"),
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80",
        categoryName: "Science"),
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
        categoryName: "Sports"),
    CatergoryModel(
        imageAsset:
            "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
        categoryName: "Technology")
  ];

  List<CatergoryModel> get category {
    return [..._list];
  }
}
