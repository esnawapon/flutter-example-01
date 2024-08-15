import 'package:flutter_example_01/domain/entity/article.dart';
import 'package:flutter_example_01/domain/repository/article_repository.dart';

class GetArticle {
  const GetArticle({
    required ArticleRepository articleRepository,
  }) : _articleRepository = articleRepository;

  final ArticleRepository _articleRepository;

  Future<List<Article>> call() {
    return _articleRepository.getArticles();
  }
}
