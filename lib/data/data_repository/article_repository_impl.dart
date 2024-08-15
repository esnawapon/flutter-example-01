import 'package:flutter_example_01/data/data_source/dto/article_dto.dart';
import 'package:flutter_example_01/data/data_source/local/article_local.dart';
import 'package:flutter_example_01/data/data_source/network/article_api.dart';
import 'package:flutter_example_01/domain/entity/article.dart';
import 'package:flutter_example_01/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl({
    required ArticleApi articleApi,
    required ArticleLocal articleLocal,
  })  : _articleApi = articleApi,
        _articleLocal = articleLocal;

  final ArticleApi _articleApi;
  final ArticleLocal _articleLocal;

  @override
  Future<List<Article>> getArticles() async {
    late final List<ArticleDto> results;
    final localResults = await _articleLocal.read();
    if (localResults.isNotEmpty) {
      results = localResults;
    } else {
      final apiResults = await _articleApi.getArticles();
      await _articleLocal.write(apiResults);
      results = apiResults;
    }

    return results
        .map((e) => Article(
              title: e.title,
              body: e.body,
              image: e.image,
            ))
        .toList();
  }
}
