import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_example_01/data/data_source/dto/article_dto.dart';

abstract class ArticleApi {
  Future<List<ArticleDto>> getArticles();
}

class ArticleFireStore extends ArticleApi {
  @override
  Future<List<ArticleDto>> getArticles() async {
    final collection = FirebaseFirestore.instance.collection("articles");
    final results = await collection.get();
    return results.docs.map((e) => ArticleDto.fromJson(e.data())).toList();
  }
}
