import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_01/data/data_repository/article_repository_impl.dart';
import 'package:flutter_example_01/data/data_source/local/article_local.dart';
import 'package:flutter_example_01/data/data_source/network/article_api.dart';
import 'package:flutter_example_01/domain/repository/article_repository.dart';
import 'package:flutter_example_01/domain/use_case/get_article.dart';
import 'package:flutter_example_01/firebase_options.dart';
import 'package:flutter_example_01/presentation/root/app.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await injectDependencies();
  runApp(const App());
}

Future<void> injectDependencies() async {
  GetIt.I.registerLazySingleton<ArticleApi>(() => ArticleFireStore());
  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerLazySingleton<ArticleLocal>(() => ArticleSharedPreferences(sharedPreferences: sharedPreferences));
  GetIt.I.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(
      articleApi: GetIt.I<ArticleApi>(),
      articleLocal: GetIt.I<ArticleLocal>(),
    ),
  );
  GetIt.I.registerLazySingleton<GetArticle>(
    () => GetArticle(
      articleRepository: GetIt.I<ArticleRepository>(),
    ),
  );
}
