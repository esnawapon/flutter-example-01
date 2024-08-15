import 'package:flutter_example_01/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles();
}
