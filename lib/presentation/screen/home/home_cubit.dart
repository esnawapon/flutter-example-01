import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_01/domain/entity/article.dart';
import 'package:flutter_example_01/domain/repository/article_repository.dart';
import 'package:flutter_example_01/domain/use_case/get_article.dart';
import 'package:get_it/get_it.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void getArticles() async {
    final results = await GetArticle(articleRepository: GetIt.I<ArticleRepository>()).call();
    emit(state.copyWith(articles: results));
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.articles = const [],
  });

  final List<Article> articles;

  HomeState copyWith({
    List<Article>? articles,
  }) {
    return HomeState(
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [
        articles,
      ];
}
