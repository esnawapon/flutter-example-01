import 'dart:convert';

import 'package:flutter_example_01/data/data_source/dto/article_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticleLocal {
  Future<List<ArticleDto>> read();
  Future<void> write(List<ArticleDto> values);
}

const _key = "articles";

class ArticleSharedPreferences extends ArticleLocal {
  final SharedPreferences _sharedPreferences;

  ArticleSharedPreferences({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<List<ArticleDto>> read() async {
    final results = _sharedPreferences.getStringList(_key);
    return results?.map((e) => ArticleDto.fromJson(jsonDecode(e))).toList() ?? [];
  }

  @override
  Future<void> write(List<ArticleDto> values) async {
    final results = values.map((e) => jsonEncode(e.toJson())).toList();
    await _sharedPreferences.setStringList(_key, results);
  }
}
